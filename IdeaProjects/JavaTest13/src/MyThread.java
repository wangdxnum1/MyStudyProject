import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/**
 * Created by Hakim on 16/8/31.
 */
public class MyThread extends Thread {
    public void run(){
        System.out.println(Thread.currentThread().getName());
    }
    public static void main(String[] args){
        System.out.println(currentThread().getName());
        new MyThread().run();

        System.out.println("++++++++++++++");

        new Thread(new SecondThread(),"second").start();


        SecondThread t = new SecondThread();
        t.test();


        System.out.println("++++++++++++++");

        FutureTask<String> task = new FutureTask<String>((Callable<String>) ()->{
            for (int i = 0; i < 100; ++i){
                System.out.println(Thread.currentThread().getName() + "的i = " + i);
            }
            return "hello thread";
        });

        for (int i = 0; i < 100; ++i){
            if(i == 20){
                new Thread(task,"MyTask").start();
                try {
                    System.out.println(task.get());
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (ExecutionException e) {
                    e.printStackTrace();
                }
            }
            System.out.println(Thread.currentThread().getName() + "的i = " + i);
        }


        StringBuilder name = new StringBuilder("wang");
        name.append("zefeg");


        System.out.println(name);
    }
}
