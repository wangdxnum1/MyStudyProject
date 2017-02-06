import java.io.IOException;
import java.math.BigDecimal;
import java.time.Month;
import java.time.Year;
import java.util.Calendar;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

/**
 * Created by Hakim on 16/8/1.
 */
public class Main {
    static public void main(String[] args) throws IOException {
        System.out.println(args.length);
        for (String arg : args){
            System.out.println(arg);
        }

//        Scanner sc = new Scanner(System.in);
//        sc.useDelimiter(",");
//        while (sc.hasNextLine()){
//            System.out.println(sc.nextLine());
//        }


        Map<String,String> envMap = System.getenv();
        for (String key : envMap.keySet()){
            System.out.println(key + "=" + envMap.get(key));
        }

        System.out.println("++++++++++++++++++");

        System.out.println(System.getenv("JAVA_HOME"));

        System.out.println(System.getProperty("os.name"));

        System.out.println(System.currentTimeMillis());


        Runtime rt = Runtime.getRuntime();
        System.out.println(rt.availableProcessors());

        System.out.println(rt.totalMemory());
        System.out.println(rt.freeMemory());
        System.out.println(rt.maxMemory());

        rt.exec("ls -al");


        Random r = new Random(50);

        System.out.println(r.nextBoolean());
        System.out.println(r.nextInt());
        System.out.println(r.nextInt(30));
        System.out.println(r.nextDouble());

        Random r1 = new Random(50);

        System.out.println(r1.nextBoolean());
        System.out.println(r1.nextInt());
        System.out.println(r1.nextInt(30));
        System.out.println(r1.nextDouble());

        BigDecimal f1 = new BigDecimal("0.05");

        BigDecimal f2 = new BigDecimal("0.003");

        System.out.println(f1.add(f2));


        Calendar ca = Calendar.getInstance();

        System.out.println(ca.get(Calendar.YEAR));
        System.out.println(ca.get(Calendar.MONTH));
    }

}
