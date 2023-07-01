import 'package:flutter/material.dart';
import 'app.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();

  // void send_message(String message) 
  // {
  //   Socket.connect('192.168.100.55', 12345).then((socket) {
  //     socket.writeln(message);
  //     socket.flush();
  //     socket.transform(utf8.decoder.cast()).listen((response) 
  //     {
  //       if(response == "ok")
  //       {
  //               Navigator.push(
  //                 context,
  //                 PageRouteBuilder(
  //                   transitionDuration: Duration(milliseconds: 400),
  //                   pageBuilder: (_, __, ___) => app(),
  //                   transitionsBuilder: (_, animation, __, child) {
  //                     return SlideTransition(
  //                       position: Tween<Offset>(
  //                         begin: Offset(0.0, 2.0),
  //                         end: Offset.zero,
  //                       ).animate(animation),
  //                       child: child,
  //                     );
  //                   },
  //                 ),
  //               );
  //       }

  //       if(response == "notok")
  //       {
  //             showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: Text('خطا'),
  //               content: Text('مقادیر ورودی را کنترل کنید'),
  //               actions: <Widget>[
  //                 ElevatedButton(
  //                   child: Text('متوجه شدم'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //       }


      });
      socket.close();

    }).catchError((e) 
    {
      print(e);
    });
  }





  @override
  Widget build(BuildContext context) {
    send_message("HI");
    return MaterialApp(
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return LoginPage();
            },
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final container = Center(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ورود به علی بابا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller:c1,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'نام کاربری',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller:c2,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'رمز عبور',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: _isPasswordVisible,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () 
                {
                    Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 400),
                      pageBuilder: (_, __, ___) => app(),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0.0, 2.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  'ورود',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) => SignUpPage(),
                    transitionsBuilder: (_, animation, __, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0.0, 2.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                'حساب کاربری ندارید ؟ ثبت نام کنید',
                style: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: container,
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final container = Center(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ثبت نام در علی بابا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller:c3,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'نام کاربری',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller:c4,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'ایمیل',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller:c5,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'رمز عبور',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: _isPasswordVisible,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 400),
                      pageBuilder: (_, __, ___) => app(),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0.0, 2.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  'ثبت نام',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) => LoginPage(),
                    transitionsBuilder: (_, animation, __, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0.0, 2.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                'حساب کاربری دارید ؟ وارد شوید',
                style: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: container,
    );
  }
}
