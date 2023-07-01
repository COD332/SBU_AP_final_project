import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class User {
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
    private String birthDay;
    private String nationalCode;
    
    public User(String firstName, String lastName, String username, String email, String password,
            String birthDay, String nationalCode) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.birthDay = birthDay;
        this.nationalCode = nationalCode;
    }
    
    // Getter methods
    public String getFirstName() {
        return firstName;
    }
    
    public String getLastName() {
        return lastName;
    }
    
    public String getUsername() {
        return username;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public String getBirthDay() {
        return birthDay;
    }
    
    public String getNationalCode() {
        return nationalCode;
    }
    
    // Setter methods
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }
    
    public void setNationalCode(String nationalCode) {
        this.nationalCode = nationalCode;
    }
}

class UserFileManager {
    private String filename;
    
    public UserFileManager(String filename) {
        this.filename = filename;
    }
    
    public User getUserByUsername(String username) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] fields = line.split(",");
            if (fields.length == 7 && fields[2].equals(username)) {
                reader.close();
                return new User(fields[0], fields[1], fields[2], fields[3], fields[4], fields[5], fields[6]);
            }
        }
        reader.close();
        return null;
    }
    
    public void setFieldByUsername(String username, String field, String value) throws IOException {
        List<String> lines = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] fields = line.split(",");
            if (fields.length == 7 && fields[2].equals(username)) {
                switch (field) {
                    case "firstName":
                        fields[0] = value;
                        break;
                    case "lastName":
                        fields[1] = value;
                        break;
                    case "email":
                        fields[3] = value;
                        break;
                    case "password":
                        fields[4] = value;
                        break;
                    case "birthDay":
                        fields[5] = value;
                        break;
                    case "nationalCode":
                        fields[6] = value;
                        break;
                    default:
                        break;
                }
            }
            lines.add(String.join(",", fields));
        }
        reader.close();
        
        BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
        for (String updatedLine : lines) {
            writer.write(updatedLine);
            writer.newLine();
        }
        writer.close();
    }
    
    // Example usage
    public static void main(String[] args) {
        UserFileManager manager = new UserFileManager("info.txt");
        try {
            User user = manager.getUserByUsername("john123");
            if (user != null) {
                System.out.println("Email: " + user.getEmail());
                
                // Update the email
                manager.setFieldByUsername("john123", "email", "newemail@example.com");
                user = manager.getUserByUsername("john123");
                if (user != null) {
                    System.out.println("Updated Email: " + user.getEmail());
                } else {
                    System.out.println("User not found.");
                }
            } else {
                System.out.println("User not found.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
