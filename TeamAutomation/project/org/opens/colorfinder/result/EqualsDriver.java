import org.opens.colorfinder.result.*;
import org.opens.colorfinder.*;
import org.opens.utils.colorconvertor.*;
import org.opens.utils.contrastchecker.*;
import java.awt.Color;

public class EqualsDriver{
    
    /* Color values */
    private static final int C_RED = 255;
    private static final int C_GREEN = 0;
    private static final int C_BLUE = 0;
    /* Comparison color values */
    private static final int CC_RED = 0;
    private static final int CC_GREEN = 0;
    private static final int CC_BLUE = 255;
    /* Threshold value */
    private static final double THRESHOLD = 50.0;

    
    public static void main(String[] args){
        String form = "Form: java test.EqualsDriver <Object Type> [arg1, arg2, ...]\n"
        if (args.length <= 0){
            System.out.printf("Arguments expected.\n" + form);
            return; // exit program
        }
        
        // initial object to test against
        ColorCombinaisonImpl test = new ColorCombinaisonImpl(new Color(C_RED,C_GREEN,C_BLUE),
                                    new Color(CC_RED,CC_GREEN,CC_BLUE), THRESHOLD);
        // inital comparison object
        Object comparison = null;

        switch(args[0]){
            case "null":
                // Do nothing; object already null
                break;
            case "self":
                comparison = test;
                break;
            case "Integer":
                comparison = new Integer(args[1]);
                break;
            case "String":
                comparison = new String(args[1]);
                break;
            case "ColorCombinaisonImpl":
                // Case not fully built yet
                comparison = new ColorCombinaisonImpl();
                if (args.length > 1){
                    int[] argNums = new int[6];
                    double argThresh = 0;
                    for (int i = 1; i < 7; i++){
                        try{
                            argNums[i + 2] = Integer.parseInt(args[i])
                        }
                        catch(Exception e){
                            System.out.println("Arguments passed do not match expected." + form);
                        }
                    }
                }
                break;
            default :
                System.out.println("Object type not recognized by driver.");
                return; // exit program
        }
        
        
        
        // declare test conditions in shell
        System.out.printf("Comparing ColorCombinaisonImpl(Color(%d, %d, %d), Color(%d, %d, %d), %.1f) to %s: ",
                          test.getColor().getRed(), test.getColor().getGreen(), test.getColor().getBlue(),
                          test.getComparisonColor().getRed(), test.getComparisonColor().getGreen(),
                          test.getComparisonColor().getBlue(), test.getThreshold(),
                          comparison);

        // print test results
        System.out.printf("%s\n", test.equals(comparison));
           
    }
}
