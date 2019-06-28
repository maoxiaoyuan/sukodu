import com.sudoku.biz.HouseOrderBiz;
import com.sudoku.biz.impl.HouseOrderBizImpl;
import com.sudoku.controller.HouseOrderController;
import com.sudoku.entity.HouseOrder;
import com.sudoku.global.House;
import com.sudoku.util.DateUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class test {



    @Test
    public void testHouse(){
        Map<String,Object> h1=House.getInstance().getHouseMap();
        Map<String,Object> h2=House.getInstance().getHouseMap();
        Map<String,Object> h3=House.getInstance().getHouseMap();
        h1.put("h1","呼呼");
        h2.put("h2","呼呼");
        h3.put("h3","呼呼");


        List<String> list = new ArrayList<>();
        list.add(0,"1111");
        list.add(1,"222");
        list.add(2,"333");
        list.add(3,"444");
        list.add(4,"555");
        list.add(5,"666");
        list.add(6,"777");

        int index=0;
        for(String lis:list){
            if(index<6) {
                System.out.println(lis);
                index++;
            }else{
                break;
            }

        }

    }

    @Test
    public void testException(){
        try {
            int y=0;
            if(y==0)
                throw new Exception("除数不可以为0");
            int x=6/y;

            return;
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            System.out.println("1111111");
        }
    }

}
