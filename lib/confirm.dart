import 'package:flutter/material.dart';
import 'done.dart';
import 'conv.dart';

class Confirm extends StatelessWidget {
    final String data;
    const Confirm({Key? key, required this.data}) : super(key: key);


TableRow add_row(String x,String y,String z)
{
 return  TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(toPersianNumber(z))),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(y)),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(x)),
                            ),
                          ),
                        ],
                      );
}


  @override
  Widget build(BuildContext context) {

    int currentStep = 3;
    List<String> steps = ['انتخاب پرواز', 'مشخصات مسافران', 'تایید اطلاعات', 'پرداخت'];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / steps.length,
                      child: Text(
                        steps[index],
                        style: TextStyle(fontSize: 13.0),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.0),
              LinearProgressIndicator(
                value: currentStep / steps.length,
                minHeight: 10,
              ),
              SizedBox(height: 20.0),
              Text(
                'اطلاعات بلیط' ,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: IntrinsicColumnWidth(),
                      3: IntrinsicColumnWidth(),
                      4: IntrinsicColumnWidth(),
                    },
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
                              child: Center(child: Text('شرکت هواپیمایی')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.grey[300],
                              child: Center(child: Text('مقصد')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.grey[300],
                              child: Center(child: Text('مبدا')),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(data.split("###")[0].split("-")[3].split(" ")[0])),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Text(data.split("###")[0].split("-")[4]+' - '+data.split("###")[0].split("-")[2])),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(data.split("###")[0].split("-")[0]=="img/al1.png"?"آسمان":data.split("###")[0].split("-")[0]=="img/al2.png"?"ساها":"ایران ایر")),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(data.split("###")[0].split("-")[1].split(" → ")[1])),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(data.split("###")[0].split("-")[1].split(" → ")[0])),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              Text(
                'اطلاعات مسافران',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),

            SizedBox(height: 20),
Center(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.grey[300],
                child: Center(child: Text('کد ملی')),
              ),
            ),
            TableCell(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.grey[300],
                child: Center(child: Text('جنسیت')),
              ),
            ),
            TableCell(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.grey[300],
                child: Center(child: Text('نام و نام خانوادگی')),
              ),
            ),
          ],
        ),
        for (var i = 0; i < data.split("###")[1].split("-").length-1; i++)
          add_row(data.split("###")[1].split("-")[i], data.split("###")[2].split("-")[i] , data.split("###")[3].split("-")[i]),
      ],
    ),
  ),
),

                SizedBox(height: 40.0),


            SizedBox(width: 20),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.label),
                  labelText: 'کد تخفیف',
                  border: OutlineInputBorder(),
                ),
              ),
            ),






              SizedBox(height: 60.0),
              SizedBox(
                width: 200.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) => done(),
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
                    textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  icon: Icon(Icons.check),
                  label: Text('تایید و پرداخت'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
