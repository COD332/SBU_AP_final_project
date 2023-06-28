import java.util.Scanner;
import java.util.regex.Pattern;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;
import java.util.Arrays;

public class LoginPage {
    private static HashSet<String> usernames = new HashSet<>();

    public static void main(String[] args) {
        loadUsernamesFromFile();

        Scanner scanner = new Scanner(System.in);

        String username = getUsername(scanner);
        String password = getPassword(scanner);

        if (validateCredentials(username, password)) {
            System.out.println("Login successful!");
        } else {
            System.out.println("Incorrect username or password!");
        }

        scanner.close();
    }

    private static void loadUsernamesFromFile() {
        try {
            String projectDir = System.getProperty("user.dir");
            File file = new File(projectDir + "/../data/info.txt");

            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] userInfo = line.split(",");
                String username = userInfo[2];
                usernames.add(username);
            }
            scanner.close();
        } catch (IOException e) {
            System.out.println("An error occurred while loading usernames from file.");
            e.printStackTrace();
        }
    }

    private static String getUsername(Scanner scanner) {
        System.out.print("Enter username: ");
        String username = scanner.nextLine();
        return username;
    }

    private static String getPassword(Scanner scanner) {
        System.out.print("Enter password: ");
        String password = scanner.nextLine();
        return password;
    }

    private static boolean validateCredentials(String username, String password) {
        try {
            String projectDir = System.getProperty("user.dir");
            File file = new File(projectDir + "/../data/info.txt");

            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] userInfo = line.split(",");
                String storedUsername = userInfo[2];
                String storedPassword = userInfo[4];

                if (username.equals(storedUsername) && password.equals(storedPassword)) {
                    scanner.close();
                    return true;
                }
            }
            scanner.close();
        } catch (IOException e) {
            System.out.println("An error occurred while validating credentials.");
            e.printStackTrace();
        }
        return false;
    }
}
