import java.util.Scanner;

public class RegistrationPage {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter username: ");
        String username = scanner.nextLine();

        scanner.close();

        // Check if username is unique
        if (isUsernameTaken(username)) {
            System.out.println("Error: Username already taken.");
            return;
        }

        System.out.print("Enter password: ");
        String password = scanner.nextLine();

        // Validate password requirements
        if (!isValidPassword(password)) {
            System.out.println("Error: Invalid password.");
            return;
        }

        System.out.print("Enter email: ");
        String email = scanner.nextLine();

        // Validate email format
        if (!isValidEmail(email)) {
            System.out.println("Error: Invalid email format.");
            return;
        }

        // Save the registration information to the server/database
        saveRegistrationInfo(username, password, email);

        System.out.println("Registration successful!");
    }

    private static boolean isUsernameTaken(String username) {
        // Check if the username is already taken in the database
        // Implement your logic here
        return false;
    }

    private static boolean isValidPassword(String password) {
        // Validate password requirements
        // Implement your logic here
        return true;
    }

    private static boolean isValidEmail(String email) {
        // Validate email format
        // Implement your logic here
        return true;
    }

    private static void saveRegistrationInfo(String username, String password, String email) {
        // Save the registration information to the server/database
        // Implement your logic here
    }
}
