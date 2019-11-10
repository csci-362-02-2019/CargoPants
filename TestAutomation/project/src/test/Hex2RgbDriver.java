package test;

import org.opens.utils.colorconvertor.ColorConverter;
import java.awt.Color;

public class Hex2RgbDriver{
    public static void main(String[] args){
	
	Color color = null;

	if (args.length == 1){
        	color = Color.decode(args[0]);
	}

	if (args.length == 3){
		int r = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		int g = Integer.parseInt(args[0]);
		color = new Color(r, g, b);
	}

        String rgb = ColorConverter.hex2Rgb(color);

        System.out.println(rgb);

    }
}
