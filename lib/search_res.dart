import 'package:flutter/material.dart';

class SearchRes extends StatefulWidget {
  @override
  _SearchResState createState() => _SearchResState();
}

class _SearchResState extends State<SearchRes> {
  int _selectedIndex = 0;
  int _selectedIndex2 = 0;
  RangeValues _rangeValues = RangeValues(0, 24);

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    void _onButtonPressed2(int index) {
    setState(() {
      _selectedIndex2 = index;
    });
  }

  String replaceNumbersWithPersian(String input) {
  final Map<String, String> numberMap = {
    '0': '۰',
    '1': '۱',
    '2': '۲',
    '3': '۳',
    '4': '۴',
    '5': '۵',
    '6': '۶',
    '7': '۷',
    '8': '۸',
    '9': '۹',
  };

  String result = '';
  for (int i = 0; i < input.length; i++) {
    final String char = input[i];
    final String replacement = numberMap[char] ?? char;
    result += replacement;
  }

  return result;
}

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
  body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed(0),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    'پیشنهاد علی بابا',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed(1),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    'زودترین زمان حرکت',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed(2),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    'کمترین قیمت',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

   Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed2(0),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex2 == 0 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    '۱۴۰۱ / ۳ / ۷',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
                            Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed2(1),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex2 == 1 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    '۱۴۰۱ / ۳ / ۸',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
                            Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed2(2),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex2 == 2 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    '۱۴۰۱ / ۳ / ۹',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed2(3),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex2 == 3 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    '۱۴۰۱ / ۳ / ۱۰',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed2(4),
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex2 == 4 ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    '۱۴۰۱ / ۳ / ۱۱',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

Container(
  width: double.infinity,
  child: Row(
    children: [
      Expanded(
        child: RangeSlider(
          values: _rangeValues,
          min: 0,
          max: 24,
          onChanged: (RangeValues values) {
            setState(() {
              _rangeValues = values;
            });
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Text(
          'ساعت حرکت: ${replaceNumbersWithPersian(_rangeValues.end.round().toString())} - ${replaceNumbersWithPersian(_rangeValues.start.round().toString())}',
          style: TextStyle(fontSize: 16),
          textDirection: TextDirection.rtl,
        ),
      ),
    ],
  ),
),



          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.blue,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تهران → قزوین',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            '۸ : ۰۰',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                   
                          ),
                          Text(
                            '۱۰۰,۰۰۰ تومان',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 28.0),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'انتخاب',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.blue,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مشهد → تهران',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            '۱۰ : ۰۰',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                   
                          ),
                          Text(
                            '۲۰۰,۰۰۰ تومان',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 28.0),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'انتخاب',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0), 
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.blue,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'قم → مشهد',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            '۱۱ : ۰۰',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                    
                          ),
                          Text(
                            '۱۵۰,۰۰۰ تومان',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 28.0),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'انتخاب',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.blue,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تبریز → کرمان',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            '۱۴ : ۰۰',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      
                          ),
                          Text(
                            '۱۰۰,۰۰۰ تومان',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Expanded(
                      flex: 3,
                        child: Text(
                          'تکمیل ظرفیت',
                          style: TextStyle(
                            fontSize: 15.0,
                            color:Colors.red,
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
