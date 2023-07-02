import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;
import java.util.Scanner;

public class CLI {
    private static HashSet<String> usernames = new HashSet<>();

    public static int main_page() {

        Scanner scanner = new Scanner(System.in);

        clearTerminal();
        System.out.println("[0] Login");
        System.out.println("[1] Register");
        System.out.println("[2] Exit");
        System.out.print("\nEnter your choice: ");
        int choice = scanner.nextInt();
        return choice;
    }

    public static void main(String[] args) {

        int choice = main_page();

        while (choice == 0 || choice == 1) {

            choice = main_page();

            switch (choice) {
                case 0:
                    if (login()) {
                        // add_ticket();
                    } else {
                        System.out.println("Invalid username or password.");
                    }
                    break;
                case 1:
                    if (register()) {
                        System.out.println("register successful.");
                    } else {
                        System.out.println("register failed.");
                    }
                    break;
                case 2:
                    System.out.println("Exiting the program...");
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice. Exiting the program...");
                    System.exit(0);
            }
        }

    }

    public static void clearTerminal() {

        try {
            if (System.getProperty("os.name").contains("Windows"))
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            else
                Runtime.getRuntime().exec("clear");
        } catch (Exception e) {
            System.out.println("An error occurred while clearing the terminal.");
        }
    }

    private static boolean login() {

        Scanner scanner = new Scanner(System.in);

        clearTerminal();
        System.out.print("\nEnter your username: ");
        String username = scanner.nextLine();

        System.out.print("\nEnter your password: ");
        String password = scanner.nextLine();

        loadUsernamesFromFile();
        if (validateCredentials(username, password)) {
            return true;
        } else {
            return false;
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

                    return true;
                }
            }

        } catch (IOException e) {
            System.out.println("An error occurred while validating credentials.");
            e.printStackTrace();
        }
        return false;
    }

    private static boolean register() {

        loadUsernamesFromFile();

        Scanner scanner = new Scanner(System.in);

        clearTerminal();
        System.out.print("Enter your username: ");
        String username = scanner.nextLine();

        System.out.println("Enter your email address :");
        String email = scanner.nextLine();

        System.out.print("Enter your password: ");
        String password = scanner.nextLine();

        if (checkUsername(username) == "OK") {
            if (checkEmail(email) == "OK") {
                if (checkPassword(password) == "OK") {

                    String[] userInfo = new String[7];
                    userInfo[2] = username;
                    userInfo[3] = email;
                    userInfo[4] = password;

                    if (saveUserInfoToFile(userInfo)) {
                        return true;
                    }
                }
            }
        }
        return false;
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

        } catch (IOException e) {
            System.out.println("An error occurred while loading username from file");
            e.printStackTrace();
        }

    }

    private static String checkUsername(String username) {
        String usernameRegex = "^[a-zA-Z][a-zA-Z0-9_]*$";
        if (!username.matches(usernameRegex)) {
            return "The username format is wrong, it must start with an English letter and can only contain letters, numbers and _";
        }

        if (usernames.contains(username)) {
            return "Username is already registered";
        }

        return "OK";
    }

    private static String checkEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if (!email.matches(emailRegex)) {
            return "Email format is incorrect";
        }

        return "OK";
    }

    private static String checkPassword(String password) {
        String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@#$%])[A-Za-z\\d@#$%^&*()]{8,}$";
        if (!password.matches(passwordRegex)) {
            return "The password format is wrong, it must have at least 8 characters and must contain letters, numbers and special symbols";
        }

        return "OK";
    }

    private static boolean saveUserInfoToFile(String[] userInfo) {
        try {
            String projectDir = System.getProperty("user.dir");
            File dataDir = new File(projectDir + "/../data");
            if (!dataDir.exists()) {
                dataDir.mkdir();
            }

            FileWriter writer = new FileWriter(projectDir + "/data/info.txt", true);
            for (String info : userInfo) {
                writer.write(info + ",");
            }
            writer.write("\n");
            writer.close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }
}
