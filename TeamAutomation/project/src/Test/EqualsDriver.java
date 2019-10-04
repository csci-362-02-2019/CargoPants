public class EqualsDriver{
    public static void main(String[] args){
        if (args.length <= 0){
            System.out.println("Arguments expected. Exiting.");
            return;
        }
        for(int i = 0; i < args.length; i++){
            System.out.printf("\"%s\", ", args[i]);
        }
    }
}