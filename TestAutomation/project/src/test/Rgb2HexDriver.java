package test;

import org.opens.utils.colorconvertor.ColorConverter;
import java.awt.Color;

public class Rgb2HexDriver{
    public static void main(String[] args){

        int r = Integer.parseInt(args[0]);
        int g = Integer.parseInt(args[1]);
        int b = Integer.parseInt(args[2]);

        try{
          String hexVal = ColorConverter.rgb2Hex(new Color(r, g, b));
          System.out.println(hexVal);
        }
        catch(Exception e){
          System.out.println(e.getMessage());
        }
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
