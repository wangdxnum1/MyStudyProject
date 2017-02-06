import java.util.concurrent.RecursiveAction;

/**
 * Created by Hakim on 16/9/20.
 */
public class PrintTask extends RecursiveAction {
    private  static final int MAX_COUNT = 50;
    private int start;
    private int end;

    public PrintTask(int start,int end){
        this.start = start;
        this.end = end;
    }

    @Override
    protected void compute(){
        if(this.end - this.start <= MAX_COUNT){
            for (int i =this.start; i < this.end; ++i){
                System.out.println(Thread.currentThread().getName() + "---->>>i = " + i);
            }
        }else {
            int middle = (this.start + this.end) / 2;
            PrintTask left = new PrintTask(this.start,middle);
            PrintTask right = new PrintTask(middle,this.end);
            left.fork();
            right.fork();
        }
    }
}
