import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

/**
 * Created by Hakim on 16/9/18.
 */
public class Main extends Thread{

    public void run(){
        System.out.println("----" + getName() +"     "+ Thread.currentThread());
        for (int i = 0; i < 10; ++i){
            System.out.println("------- i = " + i);
        }
    }

    static public void main(String[] args){
        System.out.println("----" + Thread.currentThread().getName() + Thread.currentThread());

        new Main().start();


        new Thread(new TWThread(),"twthread").start();


        FutureTask<Integer> task = new FutureTask<Integer>((Callable<Integer>) ()->{
            System.out.println("----" + Thread.currentThread().getName() +"     "+ Thread.currentThread());
            for (int i = 0; i < 10; ++i){
                System.out.println("------- i = " + i);
            }
            return 0;
        });

        new Thread(task,"有返回值的线程").start();
    }
}
