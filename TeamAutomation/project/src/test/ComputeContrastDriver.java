package test;

import org.opens.utils.contrastchecker.ContrastChecker;

public class ComputeContrastDriver{
    public static void main(String[] args){

      double lighter = Double.parseDouble(args[0]);
      double darker = Double.parseDouble(args[1]);

      double contrast = ContrastChecker.computeContrast(lighter, darker);

      System.out.println(contrast);
    }
}
