import 'package:dotted_border/dotted_border.dart';
import 'package:examflutterapp/pags/customtile.dart';
import 'package:examflutterapp/pags/models/stockitems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {

  List<String> dropdownItem = ['AA','BB','CC','DD'];
  List<StockModel> stockItems = [
    StockModel(name: 'Coke',avalable: '23',details: 'Great Drink',price: '1.32',rating: '5'),
    StockModel(name: 'Pepsi',avalable: '13',details: 'Simple Drink',price: '1.32',rating: '4'),
    StockModel(name: 'Sprite',avalable: '33',details: 'Super Great Drink',price: '1.32',rating: '5'),
    StockModel(name: 'Mountain Dew',avalable: '43',details: 'Normal Drink',price: '1.32',rating: '3'),
    StockModel(name: 'Fanta',avalable: '53',details: 'Shitty Drink',price: '1.32',rating: '1'),
  ];
  String _dropSelectedItem;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          //main
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              Container(
                //produt details
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'All Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                      child: Text('Details  product details  product details  product details  product details ',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                    )
                  ],
                ),
              ),
              Divider(color: Colors.amber,height: 2,),
              Container(
                //Addnew product
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .9,
                    child: FlatButton(
                      color: Colors.amber,
                      onPressed: (){},
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 70,),
                            Icon(
                              Icons.add
                            ),
                            Text(
                              'Add A New Product'
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //Category
                width: screenWidth,
                height: screenHeight * .12,
//                  color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 23),
                      child: Text(
                        'Catergory',
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Center(
                      child: DottedBorder(
                        strokeWidth: .5,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: screenWidth - 50,
                            child: DropdownButton(
                              elevation: 0,
                              hint: Text('Please Choose a Category'),
                              value: _dropSelectedItem,
                              onChanged: (val){
                                setState(() {
                                  _dropSelectedItem = val;
                                });
                              },
                              items: dropdownItem.map((item){
                                return DropdownMenuItem(
                                  child: new Text(item),
                                  value: item,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: stockItems.map((item){
                      return CustomTile(stockModel: item);
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}