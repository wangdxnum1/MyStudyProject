/**
 * Created by Hakim on 16/8/4.
 */
public class Main {
    private String name = "wang";

    static public void main(String[] args){
        Main m = new Main();
        m.info();


        Car bus = new Bus();
        bus.drive();
    }

    public void info(){
        Inner in = new Inner();
        in.test();
    }

    private class Inner{
        public void test(){
            System.out.println(name);
        }
    }
}
