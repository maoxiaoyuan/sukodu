package com.sudoku.util;

import com.sudoku.entity.Img;
import com.sudoku.entity.Story;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import sun.security.pkcs11.wrapper.CK_DESTROYMUTEX;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


public class FileUploadUtil {

    /**
     * 单个图片上传
     * @param file
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static String upload(MultipartFile file,String path, HttpServletRequest request)throws IllegalStateException, IOException {
        if(file.isEmpty()){
            System.out.println("文件未上传");
            return null;
        }else{

            return fileTransfer(path,file,request);
        }
    }



    /**
     * 多个房源图片上传
     * @param myfiles
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static Object upload(Integer houseId,MultipartFile[] myfiles, HttpServletRequest request)throws IllegalStateException, IOException {
        List<Img> list=new ArrayList<>();
        for(MultipartFile file:myfiles) {
            if (file.isEmpty()) {
                System.out.println("文件未上传");
            } else {
                Img img=new Img();
                img.setImgPath(fileTransfer(SavePathUtil.HOUSEPHOTOS_PATH,file,request));
                img.setHouseId(houseId);
                img.setDate(DateUtil.obtainDate());
                list.add(img);
            }
        }
        return list;
    }


    /**
     * 多张故事图片上传
     * @param uploadFile
     * @param story
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static Object upload(MultipartFile[] uploadFile ,HttpServletRequest request)throws IllegalStateException, IOException {
        List imgList=new ArrayList();
        for(MultipartFile file:uploadFile) {
            if (file.isEmpty()) {
                System.out.println("文件未上传");
            } else {
                imgList.add(fileTransfer(SavePathUtil.STORY_PATH,file,request));
            }
        }
        return imgList;
    }

    public static String fileTransfer(String path,MultipartFile file, HttpServletRequest request)throws IllegalStateException, IOException {
        String name= UUID.randomUUID().toString().replace("-", "");
        String ext= FilenameUtils.getExtension(file.getOriginalFilename());
        String realPath=request.getSession().getServletContext().getRealPath(path);
        file.transferTo(new File(realPath+"/"+name+"."+ext));
        int index=realPath.indexOf("upload");
        realPath=realPath.substring(index);
        return realPath+"/"+name+"."+ext;
    }
}
