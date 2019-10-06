import Main.org.opens.colorfinder.result.*;
import java.awt.Color;

public class EqualsDriver{
    public static void main(String[] args){
        ColorCombinaisonImpl test = new ColorCombinaisonImpl(new Color(255,0,0), new Color(0,0,255), 50.0);

        System.out.println(test);
        
        /*
        if (args.length <= 0){
            System.out.println("Arguments expected. Exiting.");
            return;
        }
        for(int i = 0; i < args.length; i++){
            System.out.printf("\"%s\", ", args[i]);
        }
        */
    }
}