import 'package:flutter/material.dart';

class travels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.send),
                        labelText: 'کد سفر',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140,
                      child: TextField(
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          labelText: 'تا تاریخ',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 140,
                      child: TextField(
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          labelText: 'از تاریخ',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 25.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  icon: Icon(Icons.search),
                  label: Text('جست و جو'),
                ),
                SizedBox(height: 30.0),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[300],
                            child: Center(child: Text('هزینه')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[300],
                            child: Center(child: Text('تاریخ حرکت')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[300],
                            child: Center(child: Text('کد سفر')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۰۰,۰۰۰')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۴۰۱ / ۳ / ۲۵')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۱۱۱۱')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۰۰,۰۰۰')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۴۰۱ / ۳ / ۲۵')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۱۱۱۱')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۰۰,۰۰۰')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۴۰۱ / ۳ / ۲ِ۵')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[50],
                            child: Center(child: Text('۱۱۱۱۱')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}