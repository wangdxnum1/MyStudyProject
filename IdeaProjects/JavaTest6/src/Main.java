import java.io.IOException;
import java.util.*;

/**
 * Created by Hakim on 16/8/1.
 */
public class Main {
    static public void main(String[] args) throws IOException {
        Collection array = new ArrayList();
        array.add("1");
        array.add("2");
        array.add("3");

        System.out.println(array.size());

        System.out.println(array.contains("1"));

        System.out.println(array.contains("4"));

        array.forEach(obj->{
            System.out.println(obj);
        });

        Iterator it = array.iterator();
        while (it.hasNext()){
            System.out.println(it.next());

        }

        LinkedHashSet ls = new LinkedHashSet();
        ls.add("1");
        ls.add("2");
        ls.add("3");


        System.out.println(ls);


        TreeSet ts = new TreeSet();
        ts.add(1);
        ts.add(2);
        ts.add(3);


        ts.add(-1);
        ts.add(0);

        System.out.println(ts);



        List l = new ArrayList();
        l.add("1");
        l.add("2");
        l.add("3");

        System.out.println(l);

        ListIterator it1 = l.listIterator();

        while (it1.hasNext()){
            System.out.println(it1.next());
            it1.add("+++++++++++");
        }

        System.out.println(l);


        Map map = new HashMap();
        map.put("a",1);
        map.put("b",2);

        System.out.println(map);

    }
}
