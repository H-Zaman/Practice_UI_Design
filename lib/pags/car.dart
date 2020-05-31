import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Car extends StatefulWidget {


  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  List<String> transport = ['Large','Small','Medium'];
  String selectedTransport;
  List<String> model = ['Old','New','Rusty'];
  String selectedModel;
  List<String> color = ['Red','Blue','Yellow'];
  String selectedColor;
  List<String> fuel = ['Petrol','Diesel','Octane'];
  String selectedfuel;
  String regnumber;
  bool dateSelected = false;
  String date;

  File _image;
  final ImagePicker picker = ImagePicker();
  Future getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: ()=>Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Car Registration',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.filter_list,color: Colors.black,),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
//                color: Colors.amber,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5,),
                    Expanded(
                      child: _image == null
                          ? Center(child: Text('No Image Selected'))
                          : Image.file(_image),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.attach_file),
                          onPressed: getImage,
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.delete,color: Colors.red,),
                          onPressed: (){
                            setState(() {
                              _image = null;
                            });
                          },
                        )
                      ],
                    )
                  ],
                )
              ),
              Container(
                //Category
                width: screenWidth,
                height: 100,
//                  color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 23),
                      child: Text(
                        'Transport Type',
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Center(
                      child: DottedBorder(
                        strokeWidth: .3,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: screenWidth - 50,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                elevation: 0,
                                hint: Text('Please Choose a Category'),
                                value: selectedTransport,
                                onChanged: (val){
                                  setState(() {
                                    selectedTransport = val;
                                  });
                                },
                                items: transport.map((item){
                                  return DropdownMenuItem(
                                    child: new Text(item),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //Category
                width: screenWidth,
                height: 100,
//                  color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 23),
                      child: Text(
                        'Transport Model',
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Center(
                      child: DottedBorder(
                        strokeWidth: .3,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: screenWidth - 50,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                elevation: 0,
                                hint: Text('Please Choose a Category'),
                                value: selectedModel,
                                onChanged: (val){
                                  setState(() {
                                    selectedModel = val;
                                  });
                                },
                                items: model.map((item){
                                  return DropdownMenuItem(
                                    child: new Text(item),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //Category
                width: screenWidth,
                height: 100,
//                  color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 23),
                      child: Text(
                        'Transport Color',
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Center(
                      child: DottedBorder(
                        strokeWidth: .3,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: screenWidth - 50,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                elevation: 0,
                                hint: Text('Please Choose a Category'),
                                value: selectedColor,
                                onChanged: (val){
                                  setState(() {
                                    selectedColor = val;
                                  });
                                },
                                items: color.map((item){
                                  return DropdownMenuItem(
                                    child: new Text(item),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
//                color: Colors.red,
                width: screenWidth,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
//                      color: Colors.amber,
                      width: screenWidth / 2 - 10,
                      height: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Car Registration Number'
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: DottedBorder(
                              strokeWidth: .3,
                              color: Colors.grey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Amount',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey[200]
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[400],
                                            width: 3.0
                                        )
                                    )
                                ),
                                onChanged: (val){
                                  setState(() {
                                    regnumber = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
//                      color: Colors.blue,
                      width: screenWidth / 2 - 10,
                      height: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Fuel Type'
                            ),
                          ),
                          DottedBorder(
                            strokeWidth: .3,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  elevation: 0,
                                  hint: Text('Fuel type'),
                                  value: selectedfuel,
                                  onChanged: (val){
                                    setState(() {
                                      selectedfuel = val;
                                    });
                                  },
                                  items: fuel.map((item){
                                    return DropdownMenuItem(
                                      child: new Text(item),
                                      value: item,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              Container(
                height: 100,
                width: screenWidth,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 95,
                      width: screenWidth / 2 - 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Date of Manufacture'
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 15,),
                              Text(
                                dateSelected ? date : DateFormat.yMMMd().format(DateTime.now()),
                              ),
                              IconButton(
                                icon: Icon(Icons.date_range),
                                onPressed: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2030),
                                  ).then((onValue){
                                    setState(() {
                                      dateSelected = true;
                                      date = DateFormat.yMMMd().format(onValue);
                                    });
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 95,
                      width: screenWidth / 2 - 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Date of Registration'
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 15,),
                              Text(
                                dateSelected ? date : DateFormat.yMMMd().format(DateTime.now()),
                              ),
                              IconButton(
                                icon: Icon(Icons.date_range),
                                onPressed: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2030),
                                  ).then((onValue){
                                    setState(() {
                                      dateSelected = true;
                                      date = DateFormat.yMMMd().format(onValue);
                                    });
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
