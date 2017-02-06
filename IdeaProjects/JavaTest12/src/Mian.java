import java.io.*;

/**
 * Created by Hakim on 16/8/9.
 */
public class Mian {
    static public void main(String[] args){
        try {
            Process p = Runtime.getRuntime().exec("javac");
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getErrorStream()));

            String buf = null;
            while ((buf = br.readLine() )!= null){
                System.out.println(buf);
            }

//
//            Persion p1 = new Persion("wang",12);
//            Teacher t1 = new Teacher(p1,"1");
//            Teacher t2 = new Teacher(p1,"2");
//
//            ObjectOutputStream ofs = new ObjectOutputStream(new FileOutputStream("xxx.data"));
//
//            ofs.writeObject(p1);
//            ofs.writeObject(t1);
//            ofs.writeObject(t2);

            ObjectInputStream ifs = new ObjectInputStream(new FileInputStream("xxx.data"));

            Persion p1 = (Persion) ifs.readObject();
            Teacher t1 = (Teacher) ifs.readObject();
            Teacher t2 = (Teacher) ifs.readObject();


            System.out.println(p1);
            System.out.println(t1);
            System.out.println(t2);
        }
        catch (Exception e){

        }
    }
}
