# پروژه پایانی درس برنامه سازی پیشرفته
## HEX group
### پویا همراز
### علیرضا اسماعیل زاده

### توضیح پروژه :
این پروژه یک اپلیکیشن اندروید مشابه برنامه *** علی بابا *** است که در زمینه رزرو بلیط های مسافرتی فعالیت می کند
این پروژه شامل بخش های زیر است :

- صفحه ورود و ثبت نام
- صفحه اصلی برنامه
- صفحه پروفایل کاربر
- صفحه تراکنش ها
- صفحه تاریخچه سفر های اخیر

در کنار این برنامه ؛ یک برنامه تحت ترمینال نیز برای شرکت های هواپیمایی وجود دارد که این امکان را به شرکت ها می دهد که بتوانند تعداد بلیط  های هر خط هوایی را تغییر دهند و آمار های مربوط به شرکت خود را مشاهده کنند


## اتصال بین کلاینت و سرور
این برنامه از ظاهری قدرت گرفته از فلاتر استفاده می کند و برنامه سمت سرور و مسئولیت پردازش داده ها به عهده جاوا می باشد

اتصال بین این دو از طریق کانکشن سوکت و به شکل زیر برقرار می شود


##### کد سمت سرور :

```java
public class server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(12345);

        System.out.println("Server started !");

        while (true) {
            Socket clientSocket = serverSocket.accept();

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            String message = in.readLine();
            System.out.println(message);


            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            out.println("Hello from server");
            out.flush();

            clientSocket.close();
        }
    }
}
```

##### کد سمت کلاینت :
``` dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(String message) {
    Socket.connect('192.168.1.101', 12345).then((socket) {
      print('Connected to server');

      socket.writeln(message);
      socket.flush();


      socket.transform(utf8.decoder.cast()).listen((response) {
        print(response);
      });

      socket.close();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Socket Chat'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String message = _messageController.text;
                _messageController.clear();

                _sendMessage(message);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## پوشه بندی پروژه :
اکثر پوشه های این پروژه به نحو استاندارد نام گذاری شده است
در ادامه برخی از مهم ترین پوشه های پروژه :

- src        ===>  پوشه فایل های جاوا یا همان سرور برنامه
- lib        ===>  پوشه فایل های صفحهات برنامه یا همان فایل های فلاتر
- assets/img ===>  پوشه فایل های تصویری استفاده شده در برنامه
- socket     ===>  پوشه فایل های مربوط به کانکشن سوکت بین سرور و کلاینت


## تصاویر محیط برنامه
در پایان تصاویری از محیط برنامه و هر صفحه را مشاهده می کنید

<p align="center"> <img src="assets/img/preview (1).jpg"> </p>
<p align="center"> <img src="assets/img/preview (2).jpg"> </p>
<p align="center"> <img src="assets/img/preview (3).jpg"> </p>
<p align="center"> <img src="assets/img/preview (4).jpg"> </p>
<p align="center"> <img src="assets/img/preview (5).jpg"> </p> 
<p align="center"> <img src="assets/img/preview (6).jpg"> </p>