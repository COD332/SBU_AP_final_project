import 'package:flutter/material.dart';
import 'app.dart';

class done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/bg5.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "سفر با موفقیت رزرو شد",
                  style: TextStyle(
                    fontSize: 30.0, // increase font size to 30.0
                  ),
                ),
                SizedBox(height: 20.0), // add some space between the text and the button
                ElevatedButton.icon(
                  onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) => app(),
                              transitionsBuilder:
                                  (_, animation, __, child) {
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
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 25.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  icon: Icon(Icons.arrow_back),
                  label: Text('بازگشت'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}