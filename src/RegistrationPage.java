import java.util.Scanner;
import java.util.regex.Pattern;
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
            }

        } catch (IOException e) {
            System.out.println("هنگام بارگیری نام کاربری از فایل خطایی روی داد");
            e.printStackTrace();
        }
        scanner.close();
    }

    private static String checkUsername(String username) {
        String usernameRegex = "^[a-zA-Z][a-zA-Z0-9_]*$";
        if (!username.matches(usernameRegex)) {
            return "فرمت نام کاربری اشتباه است ، باید با حرف انگلیسی شروع شود و می تواند تنها شامل حروف ، اعداد و _ باشد";
        }

        if (usernames.contains(username)) {
            return "نام کاربری قبلا ثبت شده است";
        }

        return "OK";
    }

    private static String checkEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if (!email.matches(emailRegex)) {
            return "فرمت ایمیل اشتباه است";
        }

        return "OK";
    }

    private static String checkPassword(String password) {
        String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@#$%])[A-Za-z\\d@#$%^&*()]{8,}$";
        if (!password.matches(passwordRegex)) {
            return "فرمت رمز عبور اشتباه است ، باید حداقل دارای 8 حرف و حتما شامل حروف ، اعداد و علامت های خاص باشد";
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
            return "ثبت نام با موفقیت انجام شد و اطلاعات دخیره گردید";
        } catch (IOException e) {
            return "خطا در هنگام دخیره سازی اطلاعات";
        }
    }
}
