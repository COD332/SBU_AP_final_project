import java.util.Scanner;
import java.util.regex.Pattern;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;

public class RegistrationPage {
    private static HashSet<String> usernames = new HashSet<>();

    public static void main(String[] args) {
        loadUsernamesFromFile();

        Scanner scanner = new Scanner(System.in);

        String username = getUsername(scanner);
        String email = getEmail(scanner);
        String password = getPassword(scanner);

        String[] userInfo = new String[7];
        userInfo[2] = username;
        userInfo[3] = email;
        userInfo[4] = password;

        saveUserInfoToFile(userInfo);

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

        String usernameRegex = "^[a-zA-Z][a-zA-Z0-9_]*$";
        if (!Pattern.matches(usernameRegex, username)) {
            System.out.println(
                    "Invalid username! It must start with a letter and only contain alphanumeric characters and underscores (_).");
            return getUsername(scanner);
        }

        if (usernames.contains(username)) {
            System.out.println("Username already exists! Please choose a different username.");
            return getUsername(scanner);
        }

        return username;
    }

    private static String getEmail(Scanner scanner) {
        System.out.print("Enter email: ");
        String email = scanner.nextLine();

        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if (!Pattern.matches(emailRegex, email)) {
            System.out.println("Invalid email! Please enter a valid email address.");
            return getEmail(scanner);
        }

        return email;
    }

    private static String getPassword(Scanner scanner) {
        System.out.print("Enter password: ");
        String password = scanner.nextLine();

        String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@#$%])[A-Za-z\\d@#$%]{8,}$";
        if (!Pattern.matches(passwordRegex, password)) {
            System.out.println(
                    "Invalid password! It must be at least 8 characters long and contain at least one letter, one digit, and one special character (@, #, $, %, ...).");
            return getPassword(scanner);
        }

        return password;
    }

    private static void saveUserInfoToFile(String[] userInfo) {
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
            System.out.println("Registration successful. User information has been saved to data/info.txt.");
        } catch (IOException e) {
            System.out.println("An error occurred while saving the user information.");
            e.printStackTrace();
        }
    }
}
