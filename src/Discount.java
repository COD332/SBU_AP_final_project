import java.io.*;
import java.util.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class Discount {
    public static float use_discount(int orig_price, String code) throws IOException {
        String projectDir = System.getProperty("user.dir");
        File file = new File(projectDir + "/../data/Discount.txt");
        Scanner myReader = new Scanner(file);
        
        String[] data;

        while (myReader.hasNextLine()) {
            data = myReader.nextLine().split("-");
            if (data[0].equals(code))
                return orig_price * ((float) (100 - Integer.parseInt(data[1])) / 100);
        }

        return orig_price;
    }

    // TEST
    public static void main(String[] args) throws IOException {
        System.out.println(use_discount(1000, "yalda1400"));
        System.out.println(use_discount(1000, "yalda1399"));
    }
}