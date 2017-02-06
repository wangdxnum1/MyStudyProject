import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * Created by Hakim on 16/8/8.
 */
public class Main {
    static public void main(String[] args) throws IOException{
        Season s = Season.SPRING;
        System.out.println(s.getName());


        File f = new File(".");
        System.out.println(f.getAbsolutePath());

        String[] fileList = f.list();
        for(String aa : fileList){
            System.out.println(aa);
        }


        File bb = new File(System.currentTimeMillis() + "");
        bb.createNewFile();

    }

}
