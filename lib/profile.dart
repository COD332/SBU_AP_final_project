import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final TextEditingController _nameController = TextEditingController(
    text: 'پویا همراز',
  );
  final TextEditingController _mobileController = TextEditingController(
    text: '۰۹۳۰۶۵۹۲۱۷۱',
  );
  final TextEditingController _nationalCodeController =
      TextEditingController(text: '۱۲۳۴۵۶');
  final TextEditingController _balanceController =
      TextEditingController(text: '۱۰۰,۰۰۰');

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
   actions: [
    IconButton(
      icon: Icon(Icons.arrow_forward, color: Colors.black),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/bg5.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'img/profile.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'نام: ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'پویا همراز',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'شماره موبایل: ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _mobileController,
                              decoration: InputDecoration(
                                hintText: '۰۹۳۰۶۵۹۲۱۷۱',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'کد ملی: ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _nationalCodeController,
                              decoration: InputDecoration(
                                hintText: '۱۲۳۴۵۶',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'موجودی: ',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _balanceController,
                              enabled: false, 
                              decoration: InputDecoration(
                                hintText: '۱۰۰,۰۰۰',
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height:30),
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
                        icon: Icon(Icons.save),
                        label: Text('ذخیره'),
                      ),
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}