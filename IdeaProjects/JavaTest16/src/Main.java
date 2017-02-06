import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.TimeUnit;

/**
 * Created by Hakim on 16/9/20.
 */
public class Main{
    public static void main(String[] args) throws Exception{
        ForkJoinPool pool = new ForkJoinPool();
        pool.submit(new PrintTask(0,200));
        pool.awaitTermination(2, TimeUnit.SECONDS);
        pool.shutdown();
    }
}
