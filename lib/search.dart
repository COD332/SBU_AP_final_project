import 'package:flutter/material.dart';
import 'search_res.dart';
import 'dart:io';
import 'conv.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  int _numPassengers = 1;
  String _selectedFrom = 'تهران';
  String _selectedTo = 'مشهد';
  String _selectedType = 'دو طرفه';
  String _selectedDate = '۱۴۰۱ / ۳ / ۷';
  String _selectedDate2 = '۱۴۰۱ / ۳ / ۱۱';
  List<String> _fromLocations = [
    'تهران',
    'اصفهان',
    'شیراز',
    'مشهد',
  ];

  List<String> _toLocations = [
    'تهران',
    'اصفهان',
    'شیراز',
    'مشهد',
  ];

  List<String> types = [
    'یک طرفه',
    'دو طرفه'
  ];

  List<String> dates = [
    '۱۴۰۱ / ۳ / ۷',
    '۱۴۰۱ / ۳ / ۸',
    '۱۴۰۱ / ۳ / ۹',
    '۱۴۰۱ / ۳ / ۱۰',
    '۱۴۰۱ / ۳ / ۱۱',
  ];

  List<String> dates2 = [
    '۱۴۰۱ / ۳ / ۷',
    '۱۴۰۱ / ۳ / ۸',
    '۱۴۰۱ / ۳ / ۹',
    '۱۴۰۱ / ۳ / ۱۰',
    '۱۴۰۱ / ۳ / ۱۱',
  ];

  bool _disableSecondDateInput = false;

  void _incrementPassengers() {
    setState(() {
      _numPassengers++;
    });
  }

  void _decrementPassengers() {
    setState(() {
      if (_numPassengers > 1) {
        _numPassengers--;
      }
    });
  }

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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تعداد مسافران: '+toPersianNumber(_numPassengers.toString()),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: _decrementPassengers,
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _incrementPassengers,
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedType = newValue!;
                          _disableSecondDateInput = _selectedType == 'یک طرفه';
                        });
                      },
                      items: types.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width:20),Text(': نوع بلیط'),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedFrom,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedFrom = newValue!;
                        });
                      },
                      items: _fromLocations.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width:20),Text(': از'),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedTo,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTo = newValue!;
                        });
                      },
                      items: _toLocations.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width:20),Text(': به'),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedDate,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDate = newValue!;
                        });
                      },
                      items: dates.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width:20),Text(': تاریخ رفت'),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedDate2,
                      onChanged: _disableSecondDateInput ? null : (String? newValue) {
                        setState(() {
                          _selectedDate2 = newValue!;
                        });
                      },
                      items: dates2.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width:20),Text(': تاریخ برگشت'),
                  ],
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