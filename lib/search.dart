import 'package:flutter/material.dart';
import 'search_res.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
       elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/bg4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'جست و جوی فلان',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: 250.0,
                  height: 60.0,
                  child: ElevatedButton.icon(
                    onPressed: () 
                    {
                     Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) => SearchRes(),
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
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 30.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    icon: Icon(Icons.search),
                    label: Text('جست و جو'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
