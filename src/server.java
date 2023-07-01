import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(12345);

        System.out.println("Server started !");

        while (true) 
        {
            Socket clientSocket = serverSocket.accept();

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            String message = in.readLine();

            if(message.startsWith("login:"))
            {
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                out.println("ok");
                out.flush();
            }

            if(message.startsWith("signup:"))
            {
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                out.println("notok");
                out.flush();
            }

            


            clientSocket.close();
        }
    }
}
