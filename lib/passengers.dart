import 'package:flutter/material.dart';
import 'confirm.dart';

class Passengers extends StatefulWidget {
  @override
  _PassengersState createState() => _PassengersState();
    final String data;
    const Passengers({Key? key, required this.data}) : super(key: key);
}

class _PassengersState extends State<Passengers> {
  final List<String> genders = ['مذکر', 'مونث'];
  List<TextEditingController> nameControllers1 = List.generate(10,(index) => TextEditingController(),);
  List<String> nameControllers2 = List.generate(10,(index) => "N",);
  List<TextEditingController> nameControllers3 = List.generate(10,(index) => TextEditingController(),);
  int input_widget_counter = 1;
  List<Widget> inputFields = [];
  TextEditingController nameController = TextEditingController();
  String? selectedGender;
  TextEditingController nationalIdController = TextEditingController();
  int currentStep = 2;
  List<String> steps = ['انتخاب پرواز', 'مشخصات مسافران', 'تایید اطلاعات', 'پرداخت'];

  @override
  void initState() {
    super.initState();
  }

  Widget buildInputField() {
    input_widget_counter++;
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            controller: nameControllers1[input_widget_counter-1],
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'نام و نام خانوادگی',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.transgender),
                  labelText: 'جنسیت',
                  border: OutlineInputBorder(),
                ),
                value: selectedGender,
                items: genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                   nameControllers2[input_widget_counter-1] = value ?? "N";
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 140,
              child: TextField(
                controller: nameControllers3[input_widget_counter-1],
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.credit_card),
                  labelText: 'کد ملی',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void addInputFields() {
    setState(() {
      inputFields.add(buildInputField());
      nameController = TextEditingController();
      selectedGender = null;
      nationalIdController = TextEditingController();
    });
  }

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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.data.split("-")[0]),
                      fit: BoxFit.cover,
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
                           widget.data.split("-")[1],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            widget.data.split("-")[2],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                   
                          ),
                          Text(
                            widget.data.split("-")[3],
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
                        onPressed: () 
                        {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'تغییر',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
              
              SizedBox(height: 10.0),
              Text(
                'مشخصات مسافران',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameControllers1[0],
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'نام و نام خانوادگی',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.transgender),
                        labelText: 'جنسیت',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedGender,
                      items: genders.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(
                            gender,
                            style: TextStyle(fontSize: 13),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        nameControllers2[0] = value ?? "N";
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 140,
                    child: TextField(
                      controller: nameControllers3[0],
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                        labelText: 'کد ملی',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: inputFields,
              ),
              SizedBox(
                width: 250.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    addInputFields();
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  icon: Icon(Icons.add),
                  label: Text('اضافه کردن مسافر'),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    String data1 = "";
                    String data2 = "";
                    String data3 = "";
                    for(var i=0;i<input_widget_counter;i++)
                    {
                      data1 += nameControllers1[i].text+"-";
                      data2 += nameControllers2[i]+"-";
                      data3 += nameControllers3[i].text+"-";
                    }

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) => Confirm(data:widget.data+"###"+data1+"###"+data2+"###"+data3),
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
                    textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  icon: Icon(Icons.arrow_back),
                  label: Text('مرحله بعد'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
