import java.util.Scanner;
import java.io.File;
import java.io.IOException;
import java.util.HashSet;

public class LoginPage {
    private static HashSet<String> usernames = new HashSet<>();

    public static void main(String[] args) {

        Login("alireza", "alireza123@#");
        Login("alireza", "alireza123@#");
        Login("alireza", "alireza123@#");
        Login("alireza", "alireza123@#");
        Login("alireza", "alireza123@#");
        Login("alireza", "alireza");

    }

    private static String Login(String username, String password) {

        loadUsernamesFromFile();
        if (validateCredentials(username, password)) {
            return "OK";
        } else {
            return "The username or password is incorrect";
        }

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
            System.out.println("Error while reading user information file");
            e.printStackTrace();
        }
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
