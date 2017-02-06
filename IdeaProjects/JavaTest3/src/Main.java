/**
 * Created by Hakim on 16/7/28.
 */
public class Main {
    final private String name;
    private int age;

    public Main(){
        name = "wang";
        age = 10;
    }

    public void test1(){
        this.age = 12;

        System.out.println(this.name);
    }

    public void test2(){
        Inner test1 = new Inner();
        test1.info();
    }

    private class Inner{
        private String hhe;
        private int age;

        public Inner(){
            this.hhe = "fda";
            this.age = 123;
        }

        public void info(){
            System.out.println(Main.this.name);
        }

    }


    public static  void main(String[] args){
        Main test = new Main();
        test.test1();
        test.test2();
    }
}
