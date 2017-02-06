/**
 * Created by Hakim on 16/9/18.
 */
public class TWThread implements Runnable{
    public  void run(){
        System.out.println("----" +Thread.currentThread().getName() +"    "+ Thread.currentThread());
        for (int i = 0; i < 10; ++i){
            System.out.println("------- i = " + i);
        }
    }
}
