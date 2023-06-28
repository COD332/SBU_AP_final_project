import 'package:flutter/material.dart';

class purchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
        body:Container(


                decoration: BoxDecoration(
         image: DecorationImage(
            image: AssetImage('img/bg5.png'),
            fit: BoxFit.cover,
          ),
      ),
        
        child:Center(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130.0,
                      height: 50.0,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 15.0),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        icon: Container(),
                        label: Text('افزایش اعتبار'),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          labelText: 'مبلغ',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                            child: Center(child: Text('مبلغ')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[300],
                            child: Center(child: Text('تاریخ')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.grey[300],
                            child: Center(child: Text('کد رهگیری')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.green[200],
                            child: Center(child: Text('+۱۰۰,۰۰۰')),
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
                            child: Center(child: Text('۵۴۷۲۳۸۲۹۳۸')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.red[200],
                            child: Center(child: Text('-۱۰۰,۰۰۰')),
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
                            child: Center(child: Text('۵۴۷۲۳۸۲۹۳۸')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.green[200],
                            child: Center(child: Text('+۱۰۰,۰۰۰')),
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
                            child: Center(child: Text('۵۴۷۲۳۸۲۹۳۸')),
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
      ),
    );
  }
}