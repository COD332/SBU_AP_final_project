import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        fit: BoxFit.cover),
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
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), 
                  labelText: 'نام کاربری',
                  border:OutlineInputBorder(),
                  
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key), 
                  labelText: 'رمز عبور',
                  border:OutlineInputBorder(),
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
                onPressed: () {},
                child: Text(
                  'ورود',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Roboto',
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
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text(
                'حساب کاربری ندارید ؟ ثبت نام کنید',
                style: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 18,
                  fontFamily: 'Roboto',
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
        fit: BoxFit.cover),
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
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), 
                  labelText: 'نام کاربری',
                  border:OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), 
                  labelText: 'ایمیل',
                  border:OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key), 
                  labelText: 'رمز عبور',
                  border:OutlineInputBorder(),
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
                onPressed: () {},
                child: Text(
                  'ثبت نام',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Roboto',
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'حساب کاربری دارید ؟ وارد شوید',
                style: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 18,
                  fontFamily: 'Roboto',
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
