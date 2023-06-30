import java.io.*;
import java.util.*; 
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class Ticket
{
    int id = (int)(Math.random() * 10000000 + 10000);
    String company;
    String from;
    String to;
    String time;
    int price;
    String date;

    public Ticket(String company, String from , String to , String time , int price , String date) throws IOException
    {
        this.company = company;
        this.from = from;
        this.to = to;
        this.time = time;
        this.price = price;
        this.date = date;
        String file_str = company+"-"+from+"-"+to+"-"+time+"-"+Integer.toString(price)+"-"+date+"-"+Integer.toString(id)+"\n";
        Files.write(Paths.get("Ticket.txt"), file_str.getBytes(),StandardOpenOption.APPEND);

    }

    public static String get_tickets() throws IOException
    {
        File obj = new File("Ticket.txt");
        Scanner myReader = new Scanner(obj);
        String data = "";

        while (myReader.hasNextLine()) 
        {
          data += myReader.nextLine()+"\n";
        }

        return data;
    }

    public static String filter_from(String data,String from)
    {
        String res = "";
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            if(tickets[i].split("-")[1].equals(from))
            {
                res += tickets[i];
            }
        }

        return res;
    }

    public static String filter_to(String data,String to)
    {
        String res = "";
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            if(tickets[i].split("-")[2].equals(to))
            {
                res += tickets[i];
            }
        }

        return res;
    }


    public static String sort_by_price(String data)
    {
        String res = "";
        int min = 9999999;
        int index = 0;
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            for(int j=0;j<tickets.length;j++)
            {
                if(Integer.parseInt(tickets[j].split("-")[4])<min)
                {
                    min = Integer.parseInt(tickets[j].split("-")[4]);
                    index = j;
                }
            }
            res+=tickets[index]+"\n";
            min = 9999999;
            tickets[index] = "0-0-0-9999999-9999999-9999999-0";
        }

        return res; 
    }

    public static String sort_by_time(String data)
    {
        String res = "";
        int min = 9999999;
        int index = 0;
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            for(int j=0;j<tickets.length;j++)
            {
                if(Integer.parseInt(tickets[j].split("-")[3])<min)
                {
                    min = Integer.parseInt(tickets[j].split("-")[3]);
                    index = j;
                }
            }
            res+=tickets[index]+"\n";
            min = 9999999;
            tickets[index] = "0-0-0-9999999-9999999-9999999-0";
        }

        return res; 
    }


    public static String filter_time(String data,int in,int fi)
    {
        String res = "";
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            int temp_time = Integer.parseInt(tickets[i].split("-")[3]);
            if(temp_time >= in && temp_time <= fi)
            {
                res += tickets[i]+"\n";
            }
        }

        return res;
    }

    public static String get_tickets_by_date(String data,String date)
    {
        String res = "";
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            if(tickets[i].split("-")[5].equals(date))
            {
                res += tickets[i]+"\n";
            }
        }

        return res; 
    }

    public static String get_tickets_by_id(String data,int id)
    {
        String res = "";
        String[] tickets = data.split("\n");
        for(int i=0;i<tickets.length;i++)
        {
            if(Integer.parseInt(tickets[i].split("-")[6])==id)
            {
                res += tickets[i]+"\n";
            }
        }

        return res; 
    } 

    // TEST
    public static void main(String[] args) throws IOException
    {
        //Ticket t1 = new Ticket("mahan","x","y","8",100,"1401/3/1");
        //Ticket t2 = new Ticket("mahan","x","y","8",100,"1401/3/2");
        //Ticket t3 = new Ticket("mahan","x","y","8",100,"1401/3/3");
        // System.out.println(sort_by_price(get_tickets()));
        // System.out.println(sort_by_time(get_tickets()));
        // System.out.println(get_tickets_by_date(get_tickets(),"1401/3/7"));
        //System.out.println(get_tickets_by_id(get_tickets(),2372881));
        // System.out.println(filter_time(get_tickets(),3,5));
    }
}