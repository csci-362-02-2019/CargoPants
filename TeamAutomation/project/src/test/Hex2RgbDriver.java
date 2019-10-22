package test;

import org.opens.utils.colorconvertor.ColorConverter;
import java.awt.Color;

public class Hex2RgbDriver{
    public static void main(String[] args){

        Color color = Color.decode(args[0]);

        String rgb = ColorConverter.hex2Rgb(color);

        System.out.println(rgb);

    }
}
