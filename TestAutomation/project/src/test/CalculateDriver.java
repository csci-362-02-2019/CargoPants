package test;

import org.opens.utils.distancecalculator.DistanceCalculator;
import java.awt.Color;

public class CalculateDriver{
    public static void main(String[] args){

        Color toKeep;
        Color toChange;

        if (args.length == 2){
          toChange = Color.decode(args[0]);
          toKeep = Color.decode(args[1]);
        }

        else{
          int r1 = Integer.parseInt(args[0]);
          int b1 = Integer.parseInt(args[1]);
          int g1 = Integer.parseInt(args[2]);

          int r2 = Integer.parseInt(args[3]);
          int b2 = Integer.parseInt(args[4]);
          int g2 = Integer.parseInt(args[5]);

          toChange = new Color(r1, b1, g1);
          toKeep = new Color(r2, b2, g2);
        }

	try{
          Double distance = DistanceCalculator.calculate(toChange, toKeep);

          System.out.println(distance);
	}
	catch(Exception e){
	 System.out.println(e.getMessage());
	}
    }
}
