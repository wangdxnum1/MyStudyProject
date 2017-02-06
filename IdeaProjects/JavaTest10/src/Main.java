/**
 * Created by Hakim on 16/8/5.
 */

interface Product{
     void print();
     void printl1();
}

interface Eatable{
    void print(String info);
}

public class Main {
    public void test(Product p){
        p.print();
        p.printl1();
    }

    public void test1(Eatable aa){
        aa.print("lamblambda");
    }

    static public void main(String[] args){
        Main m = new Main();
        m.test(new Product() {
            @Override
            public void print() {
                System.out.println("print1111");
            }

            @Override
            public void printl1() {
                System.out.println("print22222");
            }
        });

        m.test1((String info)->{
            System.out.println(info);
        });
    }
}
