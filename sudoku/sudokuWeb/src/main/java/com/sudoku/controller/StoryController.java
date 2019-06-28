package com.sudoku.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sudoku.biz.*;
import com.sudoku.entity.*;
import com.sudoku.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/story")
public class StoryController {
    @Autowired
    private StoryBiz storyBiz;
    @Autowired
    private StoryDetailBiz storyDetailBiz;
    @Autowired
    private LikesBiz likesBiz;
    @Autowired
    private FavoritesBiz favoritesBiz;
    @Autowired
    private CommentBiz commentBiz;
    @Autowired
    private FollowersBiz followersBiz;
    @Autowired
    private UserBiz userBiz;

    @Autowired
    private   HouseOrderBiz houseOrderBiz;
    @Autowired
    private HouseBasicInfoBiz houseBasicInfoBiz;

    @Autowired
    HttpServletRequest request;

    User user =new User();

    SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/");

    public void initUser(){
         user=(User)request.getSession().getAttribute("USER");
//        System.out.println("User:"+userLogin);
//        user=userBiz.getById( user.getId());
    }

    //##########################Story的相关操作##################################

    @RequestMapping("/toStory")
    public String toStory(Map<String,Object> map){
        return "userPages/story";
    }

    @RequestMapping("/toStoryContent")
    public String toStoryContent(Map<String,Object> map){
        map.put("storyList",storyBiz.getAllStory());
        return "userPages/storyContent";
    }

    @RequestMapping("/getStoryTop")
    public String getStoryTop(Map map){
        initUser();
        List<StoryDetail> storyDetailList=storyDetailBiz.getStoryDetailTop();
        List<Story> storyList=new ArrayList<>();
        for (StoryDetail sd:storyDetailList) {
            storyList.add(storyBiz.getStoryById(sd.getStory().getSid()));
        }
        map.put("storyDetailList",storyDetailList);
        map.put("storyList",storyList);
        return "userPages/stories";
    }
    @RequestMapping("/getAllStory")
    public ModelAndView getAllStory(HttpSession session){
        initUser();
        List<StoryDetail> storyDetailList=storyDetailBiz.getAllStoryDetail();
        List<Story> storyList=new ArrayList<>();
        for (StoryDetail sd:storyDetailList) {
            storyList.add(storyBiz.getStoryById(sd.getStory().getSid()));
        }
//        System.out.println("storyList=="+storyList);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("userPages/stories");
        session.setAttribute("storyDetailList",storyDetailList);
        session.setAttribute("storyList",storyList);
//        mv.addObject("storyDetailList",storyDetailList);
//        mv.addObject("storyList",storyList);
        return mv;
    }

    @RequestMapping(value = "/getStoryById/{id}", method = RequestMethod.GET)
    public String getStoryById(Integer pageNum,@PathVariable("id") Integer id , Map map,Story story){
        initUser();
        //好友关注操作
        System.out.println(user.getId()+"-----0------"+storyBiz.getStoryById(id).getUser().getId());
        if(user.getId()!=storyBiz.getStoryById(id).getUser().getId()){
            //判断是否是用户自己写的故事
            Integer followornot=followersBiz.getFollowByUserId(user,storyBiz.getStoryById(id).getUser());
            System.out.println("followornot------1------"+followornot);
            map.put("followornot",followornot);
        }
        System.out.println("------2------");
        //故事显示操作
        List imgList=new ArrayList();
        story=storyBiz.getStoryById(id);
        imgList=getImages(story);
        List<Likes> likesList=likesBiz.getLikesByStoryId(id);
        StoryDetail storyDetail=storyDetailBiz.getStoryDetailByStoryId(id);
        int likeornot=likesBiz.getByUserStory(id,user);
        int favoriteornot=favoritesBiz.getByUserStory(id,user);

        User suser = story.getUser();
        map.put("story",story);
        map.put("user",suser);
        map.put("imgList",imgList);
        map.put("likesList",likesList);
        map.put("storyDetail",storyDetail);
        map.put("likeornot",likeornot);
        map.put("favoriteornot",favoriteornot);

        System.out.println("------4------likeornot:"+likeornot);
        //点击查看喜欢该故事的人时的关注列表
        List followornotList=new ArrayList<>();
        for (Likes like:likesList) {
            if (user.getId()!=like.getUser().getId()){
                followornotList.add(followersBiz.getFollowByUserId(user,like.getUser()));
            }else{
                followornotList.add(null);
            }
        }
        map.put("followornotList",followornotList);
        System.out.println("------5------");
        //评论分页操作
        if(pageNum == null){
            pageNum=1;
        }
        PageHelper.startPage(pageNum,5);
        List<Comment> commentList=commentBiz.getCommentByStoryId(id);
        map.put("sid",id);
        PageInfo<Comment> pageInfo=PageInfo.of(commentList);
        map.put("pageInfo",pageInfo);
        System.out.println("pageInfo.getList()---"+pageInfo.getList());
        //相关故事推荐操作
        List<StoryDetail> relatedStoryDetails=storyDetailBiz.getRelatedStoryDetail(id);
        List<Story> relatedStory=new ArrayList<>();
        for (StoryDetail sd:relatedStoryDetails) {
            relatedStory.add(sd.getStory());
        }
        List likeornotList=new ArrayList<>();
        for (Story st:relatedStory){
            relatedStoryDetails.add(storyDetailBiz.getStoryDetailByStoryId(st.getSid()));
            if (likesBiz.getByUserStory(st.getSid(),user)>=1){
                likeornotList.add(likesBiz.getByUserStory(st.getSid(),user));
            }else {
                likeornotList.add(null);
            }
        }
        System.out.println("relatedStory.size()----"+relatedStory.size());
        map.put("relatedStoryDetails",relatedStoryDetails);
        map.put("relatedStory",relatedStory);
        map.put("likeornotList",likeornotList);
        return "userPages/showstory";
    }

    @RequestMapping(value = "/getStoryByUserId", method = RequestMethod.GET)
    public String getStoryByUserId(Map map){
        initUser();
        List<Story> mystoryList=storyBiz.getStoryByUserId(user.getId());
        map.put("mystoryList",mystoryList);
        return "userPages/storyCenter";
    }
    @RequestMapping(value = "/toEditStory" ,method = RequestMethod.GET)
    public String editStory(Map map){
        initUser();
        SimpleDateFormat smft=new SimpleDateFormat("YYYY年MM月dd日");
        List<HouseOrder> orders=houseOrderBiz.getByUserId(user.getId().toString());
        List timeList =new ArrayList();
        for (HouseOrder o:orders) {
            timeList.add(smft.format(o.getBookStartTime()));
        }
        map.put("orders",orders);
        map.put("timeList",timeList);
        return "userPages/editstory";
    }

    @RequestMapping("/editStory")
    public String insertStory(MultipartFile[] uploadFile , Story story, RedirectAttributes attributes, HttpServletRequest req) throws IllegalStateException, IOException {
        initUser();
        if (story.getTourCity()==null){
            story.setTourCity("false");
        }
        story.setHouse(houseBasicInfoBiz.getHouseById(story.getHouse().getId()));
        List imgList=(List)FileUploadUtil.upload(uploadFile,request);
        storyBiz.insertStory(story,user,imgList);
        storyDetailBiz.insertStoryDetail(story.getSid(),user);
        attributes.addAttribute("sid",story.getSid());
        return "redirect:/story/getStoryById/{sid}";
    }
    @RequestMapping("deleteStoryById/{id}")
    public String  deleteStoryById(@PathVariable("id") Integer id){
        initUser();
        storyBiz.deleteStoryById(id);
        storyDetailBiz.deleteStoryDetail(id);
        return "redirect:/story/getStoryByUserId";
    }



    //##########################Like的相关操作##################################


    @RequestMapping(value = "/insertLikes", method = RequestMethod.GET)
    @ResponseBody
    public void insertLikes(Integer id , HttpServletResponse response) throws IOException{
        System.out.println("insertLikes---从ajax获取的id"+id);
        initUser();
        char f='l';
        storyDetailBiz.updateStoryDetailinsert(id,user,f);
        likesBiz.insertLikes(id,user);
        StoryDetail storyDetail=storyDetailBiz.getStoryDetailByStoryId(id);
        System.out.println("storyDetail.getLikeNum()-----"+storyDetail.getLikeNum());
        String json= JSON.toJSONString(storyDetail.getLikeNum());
        response.getWriter().write(json);
    }


    @RequestMapping(value = "/deleteLikes", method = RequestMethod.GET)
    @ResponseBody
    public void deleteLikes(Integer id , HttpServletRequest req, HttpServletResponse response) throws IOException{
        System.out.println("deleteLikes---从ajax获取的id"+id);
        initUser();
        System.out.println("req.getRequestURI()"+req.getRequestURI());
        char f='l';
        storyDetailBiz.updateStoryDetaildelete(id,user,f);
        likesBiz.deleteLikes(id,user);
        StoryDetail storyDetail=storyDetailBiz.getStoryDetailByStoryId(id);
        String json= JSON.toJSONString(storyDetail.getLikeNum());
        response.getWriter().write(json);
    }
    @RequestMapping(value ="getLikesByUserId" ,method = RequestMethod.GET)
    public String getLikesByUserId(Map map){
        initUser();
        List<Likes> likesList=likesBiz.getLikesByUserId(user.getId());
        System.out.println("---"+likesList);
        map.put("likesList",likesList);
        return "userPages/storyCenter";
    }


    //##########################Favorites的相关操作##################################


    @RequestMapping(value = "/insertFavorites", method = RequestMethod.GET)
    public void insertFavorites(Integer id ,HttpServletRequest req){
        initUser();
        System.out.println("req.getRequestURI()"+req.getRequestURI());
        char f='f';
        storyDetailBiz.updateStoryDetailinsert(id,user,f);
        favoritesBiz.insertFavorites(id,user);
    }


    @RequestMapping(value = "/deleteFavorites", method = RequestMethod.GET)
    public void deleteFavorites(Integer id ,HttpServletRequest req){
        initUser();
        System.out.println("req.getRequestURI()"+req.getRequestURI());
        favoritesBiz.deleteFavorites(id,user);
        char f='f';
        storyDetailBiz.updateStoryDetaildelete(id,user,f);
    }
    @RequestMapping(value ="getFavoritesByUserId" ,method = RequestMethod.GET)
    public String getFavoritesByUserId(Map map){
        initUser();
        List<Favorites> favoritesList=favoritesBiz.getFavoritesByUserId(user.getId());

        map.put("favoritesList",favoritesList);
        return "userPages/storyCenter";
    }


    //##########################Comment的相关操作##################################

    @RequestMapping(value = "/insertComment", method = RequestMethod.POST)
    @ResponseBody
    public void  insertComment(Integer pageNum,Integer id ,Comment comment, HttpServletResponse response) throws IOException{
        initUser();
        System.out.println("------comment.getCommentContent()"+comment.getCommentContent());
        if (comment.getCommentContent()!=null){
            commentBiz.insertComment(comment,id,user);
            char f='c';
            storyDetailBiz.updateStoryDetailinsert(id,user,f);
        }
        if(pageNum == null){
            pageNum=1;
        }
        PageHelper.startPage(pageNum,5);
        PageInfo<Comment> pageInfo=PageInfo.of(commentBiz.getCommentByStoryId(id));
        String json= JSON.toJSONString(pageInfo);
        System.out.println("json---"+json);
        response.getWriter().write(json);
    }

    @RequestMapping(value = "/changePages/{id}", method = RequestMethod.POST)
    public String changePages( Integer pageNum,@PathVariable(name = "id")Integer id , Map map, RedirectAttributes attributes) throws IOException{
        initUser();
        System.out.println("pageNum="+pageNum);
        System.out.println("id="+id);
        //评论分页操作
        if(pageNum == null){
            pageNum=1;
        }
        PageHelper.startPage(pageNum,5);
        List<Comment> commentList=commentBiz.getCommentByStoryId(id);
        map.put("sid",id);
        PageInfo<Comment> pageInfo=PageInfo.of(commentList);
        map.put("pageInfo",pageInfo);
        attributes.addAttribute("sid",id);
        return "redirect:/story/getStoryById/{sid}";
    }



    //##########################Followers的相关操作##################################


    @RequestMapping(value = "/insertFollowers/{sid}/{uid}", method = RequestMethod.POST)
    public String insertFollowers(@PathVariable("sid") Integer sid,@PathVariable("uid") Integer uid,HttpServletRequest req){
        initUser();
        System.out.println(req.getRequestURI());
        followersBiz.insertFollowers(user,userBiz.getById(uid));
        return "redirect:/story/getStoryById/{sid}";
    }

    //粉丝列表关注用户
    @RequestMapping(value = "/insertFollower/{id}", method = RequestMethod.POST)
    public String insertFollower(@PathVariable("id") Integer id,HttpServletRequest req){
        initUser();
        System.out.println("-----1"+req.getRequestURI()+"--"+id);
        followersBiz.insertFollowers(user,userBiz.getById(id));
        return "redirect:/story/getFollowers";
    }

    //获取关注列表
    @RequestMapping(value = "/getFollows" ,method = RequestMethod.GET)
    public String getFollows(Map map){
        List followornotList=new ArrayList<>();
        List<Followers> followList=followersBiz.getFollowById(user);
        for (Followers follow:followList) {
            followornotList.add(followersBiz.getFollowByUserId(user,follow.getUserFollower()));
        }
        map.put("followornotList",followornotList);
        map.put("follows",followList);
        return "userPages/storyCenter";
    }
    //获取粉丝列表
    @RequestMapping(value = "/getFollowers" ,method = RequestMethod.GET)
    public String getFollowers(Map map){
        List followornotList=new ArrayList<>();
        List<Followers> followersList=followersBiz.getFollowersById(user);
        for (Followers followers:followersList) {
            followornotList.add(followersBiz.getFollowByUserId(user,followers.getUserFollow()));
        }
        map.put("followornotList",followornotList);
        map.put("followers",followersBiz.getFollowersById(user));
        return "userPages/storyCenter";
    }

    //故事页面中的点赞列表取消关注
    @RequestMapping(value = "/deleteFollowers/{sid}/{uid}", method = RequestMethod.POST)
    public String deleteFollowers(@PathVariable("sid") Integer sid ,@PathVariable("uid") Integer uid,HttpServletRequest req){
        initUser();
        System.out.println(req.getRequestURI());
        followersBiz.deleteFollowers(user,userBiz.getById(uid));
        return "redirect:/story/getStoryById/{sid}";
    }
    //关注列表取消关注
    @RequestMapping(value = "/deleteFollow/{uid}", method = RequestMethod.POST)
    public String deleteFollow(@PathVariable("uid") Integer uid,HttpServletRequest req){
        initUser();
        System.out.println(req.getRequestURI());
        followersBiz.deleteFollowers(user,userBiz.getById(uid));
        return "redirect:/story/getFollows";
    }
    //粉丝列表取消关注
    @RequestMapping(value = "/deleteFollower/{uid}", method = RequestMethod.POST)
    public String deleteFollower(@PathVariable("uid") Integer uid,HttpServletRequest req){
        initUser();
        System.out.println(req.getRequestURI());
        followersBiz.deleteFollowers(user,userBiz.getById(uid));
        return "redirect:/story/getFollowers";
    }

    //遍历获取故事的图片
    public List getImages(Story story){
        List imgList=new ArrayList();
        if (story.getImg01()!=null){
//            System.out.println("StoryServiceImpl------------story.getImg01()!=null");
//            System.out.println("StoryServiceImpl------------story.getImg01()"+story.getImg01());
            imgList.add(story.getImg01());
            if (story.getImg02()!=null){
                imgList.add(story.getImg02());
                if (story.getImg03()!=null){
                    imgList.add(story.getImg03());
                    if (story.getImg04()!=null){
                        imgList.add(story.getImg04());
                        if (story.getImg05()!=null){
                            imgList.add(story.getImg05());
                            if (story.getImg06()!=null){
                                imgList.add(story.getImg06());
                            }
                        }
                    }
                }
            }

        }
        return imgList;
    }


}
