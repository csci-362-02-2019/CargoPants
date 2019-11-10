package test;

import org.opens.utils.colorconvertor.ColorConverter;
import java.awt.Color;

public class offsetRgbColorDriver{
    public static void main(String[] args){

          int r = Integer.parseInt(args[0]);
          int g = Integer.parseInt(args[1]);
          int b = Integer.parseInt(args[2]);
          int offsetR = Integer.parseInt(args[3]);
          int offsetG = Integer.parseInt(args[4]);
          int offsetB = Integer.parseInt(args[5]);
          Color color = new Color(r, g, b);
        try{
          Color newColor = ColorConverter.offsetRgbColor(color, offsetR, offsetG, offsetB);
          System.out.println(newColor);
        }
        catch(Exception e){
          System.out.println(e.getMessage());
        }
    }
  }
