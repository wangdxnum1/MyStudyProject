/**
 * Created by Hakim on 16/8/8.
 */
public enum Season {
    SPRING("春天"),SUMMER("夏天");
    final private String name;
    private Season(String name){
        this.name = name;
    }
    public String getName(){
        return this.name;
    }
}
