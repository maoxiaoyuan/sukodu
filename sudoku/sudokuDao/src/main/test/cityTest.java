import com.sudoku.dao.CityDao;
import com.sudoku.entity.City;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class cityTest {

    @Autowired
    @Qualifier("cityDao")
    private CityDao cityDao;
    @Test
    public void selectTest(){
        City city=cityDao.selectById(1);
        System.out.println(city);
    }
}
