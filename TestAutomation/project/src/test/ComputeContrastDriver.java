package test;

import org.opens.utils.contrastchecker.ContrastChecker;
import java.math.*;

public class ComputeContrastDriver{
    public static void main(String[] args){


            double lighter = Double.parseDouble(args[0]);
            double darker = Double.parseDouble(args[1]);
            double contrast = ContrastChecker.computeContrast(lighter, darker);
          try{
            double solution = Math.round(contrast * 100.0) / 100.0;
            System.out.println(solution);
        }
          catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
