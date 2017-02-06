/**
 * Created by Hakim on 16/7/28.
 */

interface Eatable{
    public void eat();
}

public class Main {

    public  void eat(Eatable e){
        e.eat();
    }

    static public void main(String[] args){
        Main test = new Main();
        test.eat(()->{
            System.out.println("eat");
        });
    }
}
