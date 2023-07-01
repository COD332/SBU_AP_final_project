import java.util.Scanner;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;

public class RegistrationPage {
    private static HashSet<String> usernames = new HashSet<>();

    public static void main(String[] args) {

        Register("alireza", "alireza@gmail.com", "ali123@#");
        Register("alireza", "alireza@gmail.com", "ali123@#");
        Register("alireza", "alireza@gmail.com", "ali123@#");
        Register("alireza", "alireza@gmail.com", "ali123@#");
        Register("alireza", "alireza@gmail.com", "ali123@#");

    }

    private static String Register(String username, String email, String password) {

        loadUsernamesFromFile();

        if (checkUsername(username) == "OK") {
            if (checkEmail(email) == "OK") {
                if (checkPassword(password) == "OK") {

                    String[] userInfo = new String[7];
                    userInfo[2] = username;
                    userInfo[3] = email;
                    userInfo[4] = password;

                    return (saveUserInfoToFile(userInfo));
                } else {
                    return checkPassword(password);
                }
            } else {
                return checkEmail(email);
            }
        } else {
            return checkUsername(username);
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
                scanner.close();
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

    private static String saveUserInfoToFile(String[] userInfo) {
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
            return "Registration was successful and information was saved";
        } catch (IOException e) {
            return "Error while saving data";
        }
    }
}
