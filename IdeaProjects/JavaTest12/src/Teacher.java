import sun.dc.pr.PRError;

/**
 * Created by Hakim on 16/8/10.
 */
public class Teacher implements  java.io.Serializable{
    private String name;
    private Persion student;

    public Teacher(Persion p, String name){
        this.student = p;
        this.name = name;
    }
}
