package test;

import org.opens.utils.distancecalculator.DistanceCalculator;
import java.awt.Color;

public class CalculateDriver{
    public static void main(String[] args){

        if (args.length() == 2){
          Color toChange = Color.decode(args[0]);
          Color toKeep = Color.decode(args[1]);
        }

        else{
          Color toChange = new Color(args[0], args[1], args[2]);
          Color toKeep = new Color(args[3], args[4], args[5]);
        }

        Double distance = DistanceCalculator.calculate(toChange, toKeep);

        System.out.println(distance);

    }
}
