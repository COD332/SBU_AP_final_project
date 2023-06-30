import 'package:flutter/material.dart';
import 'search.dart';
import 'travels.dart';
import 'purchase.dart';
import 'profile.dart';

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 80.0,top:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 120.0,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) => profile(),
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
                          textStyle: TextStyle(fontSize: 16.0),
                        ),
                        icon: Icon(Icons.person),
                        label: Text('پروفایل'),
                      ),
                    ),
                    SizedBox(
                      width: 120.0,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) => travels(),
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
                          textStyle: TextStyle(fontSize: 16.0),
                        ),
                        icon: Icon(Icons.card_travel),
                        label: Text('سفر ها'),
                      ),
                    ),
                    SizedBox(
                      width: 120.0,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) => purchase(),
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
                          textStyle: TextStyle(fontSize: 14.0),
                        ),
                        icon: Icon(Icons.credit_card),
                        label: Text('تراکنش ها'),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'خرید بلیط',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => search(),
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
                    textStyle: TextStyle(fontSize: 30.0),
                  ),
                  icon: Icon(Icons.flight),
                  label: Text('پرواز داخلی'),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => search(),
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
                    textStyle: TextStyle(fontSize: 30.0),
                  ),
                  icon: Icon(Icons.flight_takeoff),
                  label: Text('پرواز خارجی'),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => search(),
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
                    textStyle: TextStyle(fontSize: 30.0),
                  ),
                  icon: Icon(Icons.train),
                  label: Text('قطار'),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => search(),
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
                    textStyle: TextStyle(fontSize: 30.0),
                  ),
                  icon: Icon(Icons.directions_bus),
                  label: Text('اتوبوس'),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) => search(),
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
                    textStyle: TextStyle(fontSize: 30.0),
                  ),
                  icon: Icon(Icons.hotel),
                  label: Text('هتل'),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
           
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30.0),
                  ),
                  icon: Icon(Icons.tour),
                  label: Text('تور'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
