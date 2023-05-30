import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'نوع بلیط را انتخاب کنید',
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
