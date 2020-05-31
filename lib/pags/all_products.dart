import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  List<String> category = ['Large','Small','Medium'];
  String selectedCat;
  String textvalue;
  bool zwitch = true;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: ()=> Navigator.pop(context),
        ),
        title: Text(
          'Add New Product',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 3),
                child: Text(
                  'Add a New Product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  'Details Details Details Details Details Details Details Details Details Details Details Details Details'
                ),
              ),
              Container(
                //Category
                width: MediaQuery.of(context).size.width,
                height: 100,
//                  color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 23),
                      child: Text(
                        'Category',
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
                            width: MediaQuery.of(context).size.width - 50,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                elevation: 0,
                                hint: Text('Please Choose a Category'),
                                value: selectedCat,
                                onChanged: (val){
                                  setState(() {
                                    selectedCat = val;
                                  });
                                },
                                items: category.map((item){
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
                width: MediaQuery.of(context).size.width,
                height: 100,
//                  color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 23),
                      child: Text(
                        'Product Name',
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
                            width: MediaQuery.of(context).size.width - 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Enter Name',
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
                                  textvalue = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 3),
                child: Text(
                  'Small Description',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: DottedBorder(
                  strokeWidth: .3,
                  color: Colors.grey,
                  child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Name',
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
                        textvalue = val;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 95,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 23),
                            child: Text(
                                'Price in USD'
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 23),
                            child: DottedBorder(
                              strokeWidth: .3,
                              color: Colors.grey,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Price',
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
                                    textvalue = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      height: 95,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Date of Registration'
                          ),
                          DottedBorder(
                            strokeWidth: .3,
                            color: Colors.grey,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Weight in gr.',
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
                                  textvalue = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Text(
                        'AVAILABLE IN STOCK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: zwitch,
                          onChanged: (_){
                            setState(() {
                              zwitch = _;
                            });
                          },
                          activeTrackColor: Colors.amber,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey[700],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
//                color: Colors.blueAccent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 23,right: 4,top: 5,bottom: 5),
                      child: SizedBox(
                        height: 70,width: MediaQuery.of(context).size.width / 2 - 30,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.red,
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.delete,color: Colors.white,),
                              Text('DELETE',
                              style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4,right: 23,top: 5,bottom: 5),
                      child: SizedBox(
                        height: 70,width: MediaQuery.of(context).size.width / 2 - 30,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.black,
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('SAVE',style: TextStyle(color: Colors.white),),
                              Icon(Icons.save,color: Colors.white,),
                            ],
                          ),
                        ),
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
