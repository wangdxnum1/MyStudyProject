/**
 * Created by Hakim on 16/8/31.
 */
public class SecondThread implements  Runnable{
    public void run(){
        System.out.println(Thread.currentThread().getName());
    }

    protected void test(){
        System.out.println("test");
    }
}
