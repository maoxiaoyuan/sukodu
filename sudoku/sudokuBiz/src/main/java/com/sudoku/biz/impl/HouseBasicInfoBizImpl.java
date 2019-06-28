package com.sudoku.biz.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sudoku.biz.HouseBasicInfoBiz;
import com.sudoku.dao.HouseBasicInfoDao;
import com.sudoku.dao.HouseResourceDao;
import com.sudoku.dao.ImgDao;
import com.sudoku.dao.UserDao;
import com.sudoku.entity.HouseBasicInfo;
import com.sudoku.entity.HouseResource;
import com.sudoku.entity.Img;
import com.sudoku.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("houseBasicInfoBiz")
public class HouseBasicInfoBizImpl implements HouseBasicInfoBiz {

    @Qualifier("houseBasicInfoDao")
    @Autowired
    private HouseBasicInfoDao houseBasicInfoDao;

    @Qualifier("userDao")
    @Autowired
    private UserDao userDao;

    @Qualifier("imgDao")
    @Autowired
    private ImgDao imgDao;

    @Qualifier("houseResourceDao")
    @Autowired
    private HouseResourceDao houseResourceDao;

    //添加房源基本信息
    public void add(HouseBasicInfo houseBasicInfo)
    {
        houseBasicInfoDao.insert(houseBasicInfo);
    }

    //编辑房源信息
    public void edit(HouseBasicInfo houseBasicInfo) {

        houseBasicInfoDao.update(houseBasicInfo);
    }

    //删除房源信息
    public void remove(Integer id) {

        houseBasicInfoDao.delete(id);
    }

    //通过ID查询房源的信息
    public HouseBasicInfo getHouseById(Integer id)
    {
        return houseBasicInfoDao.selectById(id);
    }

    public List<HouseBasicInfo> getHouseByStatus(Integer status) {
        return houseBasicInfoDao.selectByStatus(status);
    }

    //通过房源的状态查询并进行分页（审核通过——[1]，审核未通过——[-1],待审核——[0]）
    public Map<String,Object> getHouseByStatus(Integer status,Integer pageNum) {
        Integer pageSize=0;

        if (pageNum==null) {
            pageNum=1;
        }

        if(status==0)   pageSize=6;

        if(status==1)   pageSize=10;

        if(status==-1)  pageSize=10;

        PageHelper.startPage(pageNum,pageSize);

        //获取对象
        List<HouseBasicInfo> list =getHouseByStatus(status);
        PageInfo pageInfo=PageInfo.of(list);

        Map<String,Object> map=new HashMap();
        map.put("pageInfo",pageInfo);

        if(status == 0) {
            map.put("path", "adminPages/wait-checked");
        }else if(status == 1){
            map.put("path", "adminPages/pass-checked");
        }else if(status == -1) {
            map.put("path", "adminPages/pass-checked");
        }
        else{
            map.put("path", "adminPages/welcome");
        }
        return map;
    }

    //通过房东的ID查询房源信息
    public List<HouseBasicInfo> getHouseByLandlordId(Integer landlordId) {
        return houseBasicInfoDao.selectBylandlordId(landlordId);
    }

    //通过房产证编号查询房源信息
    public HouseBasicInfo getHouseByCNum(String number)
    {
        return houseBasicInfoDao.selectByCNum(number);
    }

    //查询全部房源信息
    public List<HouseBasicInfo> getHouseAll() {
        return houseBasicInfoDao.selectAll();
    }

    //查询全部房源信息(用于首页)
    public List<Object> getHouseToHome() {
        List<Object> list = new ArrayList<Object>();
        int index=0;
        for(HouseBasicInfo hbi:getHouseAll()){
            if(index<6){
                Map<String,Object> map= new HashMap<String, Object>();
                map.put("title",hbi.getTitle());
                map.put("img",imgDao.selectAll(hbi.getId()).get(0).getImgPath());
                map.put("houseResource",houseResourceDao.selectByHouseId(hbi.getId()));
                list.add(map);
                index++;
            }else{
                break;
            }
        }
        return list;
    }


    //根据搜索信息（房东/房产证编号）查询房源信息
    public List<HouseBasicInfo> getHouseInfo(String searchInfo) {
        System.out.println("-------"+searchInfo);
        if(searchInfo == null||searchInfo.equals("")){
            System.out.println("没有输入要查询的信息");
            return houseBasicInfoDao.selectAll();
        }else{
            List<User> users=userDao.selectByName(searchInfo);
            if(!users.isEmpty()){
                System.out.println("user不为空,输入信息为房东姓名");
                List<HouseBasicInfo> houseInfo=new ArrayList<HouseBasicInfo>();
                for(User user:users){
                    for(HouseBasicInfo house:getHouseByLandlordId(user.getId())){
                        houseInfo.add(house);
                    }
                }
               return houseInfo;
            }else if(getHouseByCNum(searchInfo)!=null){
                System.out.println("user为空，查询的信息为房屋编号");
                List<HouseBasicInfo> house=new ArrayList<HouseBasicInfo>();
                house.add(getHouseByCNum(searchInfo));
               return house;
            }else{
               return null;
            }
        }
    }
}
