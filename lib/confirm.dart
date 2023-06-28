import 'package:flutter/material.dart';

class Confirm extends StatelessWidget {
  int currentStep = 3;
  List<String> steps = ['انتخاب پرواز', 'مشخصات مسافران', 'تایید اطلاعات', 'پرداخت'];

  @override
  Widget build(BuildContext context) {
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
                'اطلاعات بلیط',
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
                              child: Center(child: Text('۱۰۰,۰۰۰')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Text('۱۴۰۱ / ۳ / ۲۵ - ۸ : ۰۰')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('ماهان')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('تهران')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('قزوین')),
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
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('۱۲۳۴۵۶۷۸۹')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('مذکر')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('پویا همراز')),
                            ),
                          ),
                        ],
                      ),
                                            TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('۱۲۳۴۵۶۷۸۹')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('مذکر')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text('علیرضا اسماعیل زاده')),
                            ),
                          ),
                        ],
                      ),
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
                  onPressed: () {},
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
