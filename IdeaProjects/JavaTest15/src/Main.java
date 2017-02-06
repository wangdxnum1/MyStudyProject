import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Hakim on 16/9/20.
 */
public class Main {
    public static void main(String[] agrs){
            ExecutorService pool = Executors.newFixedThreadPool(6);
            Runnable target = ()->{
                for (int i = 0; i < 100; ++i){
                    System.out.println(Thread.currentThread().getName()+ ">>>> i = "+ i);
                }
            };

            pool.submit(target);
        pool.submit(target);
        pool.shutdown();

        System.out.println(Runtime.getRuntime().availableProcessors());
        }
}
