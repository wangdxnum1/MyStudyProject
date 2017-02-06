import java.io.*;

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

        System.out.println("+++++++++++++++");

        fileList = f.list((dir,name)->{
            return name.endsWith("java");
        });
        for(String aa : fileList){
            System.out.println(aa);
        }


        try (FileInputStream fio = new FileInputStream("Season.java");
             FileOutputStream fout = new FileOutputStream("out.java");

             FileWriter fw = new FileWriter("out1.java");
        ) {

            byte[] buffer = new byte[1024];
            int hasRead = 0;

            while ((hasRead = fio.read(buffer)) > 0) {
                fout.write(buffer,0,hasRead);
                fout.write(buffer);
                System.out.println(new String(buffer, 0, hasRead));
                fw.write("afdfadsfasdfasdfasd\ndafdsa");
            }
        }
        catch (IOException e){
            e.printStackTrace();
        }

//
//        File bb = new File(System.currentTimeMillis() + "");
//        bb.createNewFile();

    }

}
