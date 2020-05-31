import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class StockModel {
  String name;
  String details;
  String rating;
  String price;
  String avalable;
  bool zwitch;

  StockModel({this.name, this.avalable, this.details, this.price, this.rating,this.zwitch = true});
}

class _NewProductState extends State<NewProduct> {
  List<String> dropdownItem = ['AA', 'BB', 'CC', 'DD'];

  List<StockModel> stockModel = List<StockModel>();

  _NewProductState() {
    stockModel.add(StockModel(
        name: 'Coke',
        avalable: '23',
        details: 'Great Drink',
        price: '1.32',
        rating: '5'));
    stockModel.add(StockModel(
        name: 'Pepsi',
        avalable: '13',
        details: 'Simple Drink',
        price: '2.32',
        rating: '4'));
    stockModel.add(StockModel(
        name: 'Sprite',
        avalable: '33',
        details: 'Super Great Drink',
        price: '3.32',
        rating: '5'));
    stockModel.add(StockModel(
        name: 'Mountain Dew',
        avalable: '43',
        details: 'Normal Drink',
        price: '4.32',
        rating: '3'));
    stockModel.add(StockModel(
        name: 'Fanta',
        avalable: '53',
        details: 'Shitty Drink',
        price: '5.32',
        rating: '1'));
  }

  String _dropSelectedItem;



  Widget cell(BuildContext ctx, int index) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: stockModel[index].zwitch?Container(
        height: 150,
        child: Card(
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    //largethings
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 2),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/visa.png'),
                            radius: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                stockModel[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    stockModel[index].details
                                ),
                              ),
                              Text(
                                  'Rating ${stockModel[index].rating}'
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '\$${stockModel[index].price}',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18
                              ),
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Switch(
                                value: stockModel[index].zwitch,
                                onChanged: (value){
                                  setState(() {
                                    stockModel[index].zwitch = value;
                                  });

                                },
                                activeTrackColor: Colors.amber,
                                activeColor: Colors.white,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.grey[700],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    //menu
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                            'Available: ${stockModel[index].avalable}'
                        ),
                        FlatButton(
                          onPressed: (){},
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.mode_edit,
                                size: 16,
                              ),
                              Text(
                                  'Edit'
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
        ),
      ):Container(
        child: Card(
            child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      //largethings
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 2),
                              child: CircleAvatar(
                                backgroundColor: Colors.orange.withOpacity(0.3),

                                radius: 40,
                              ),
                            ),
                          ),
                          Container(
                            child:  Text(
                              'OUT OF STOCK',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 18
                                ),
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  value: stockModel[index].zwitch,
                                  onChanged: (value){
                                    setState(() {
                                      stockModel[index].zwitch = value;
                                    });

                                  },
                                  activeTrackColor: Colors.amber,
                                  activeColor: Colors.white,
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.grey[700],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      //menu
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex:1,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration:  BoxDecoration(
                                  color: Colors.grey[500],
                                  borderRadius: new BorderRadius.only(
                                    topRight: const Radius.circular(10.0),
                                  )
                              ),
                              child: Text(
                                  'Sold: ${stockModel[index].avalable}'
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child:  Container(
                              height: 50,
                              child: FlatButton(
                                onPressed: (){},
                                color: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.mode_edit,
                                      size: 16,
                                    ),
                                    Text(
                                        'Edit'
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            )
        ),
      ),
    );
  }

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
            child: Container(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //product details
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'All Products',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                            child: Text(
                              'Details  product details  product details  product details  product details ',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.amber,
                      height: 2,
                    ),
                    Container(
                      //Add new product
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .9,
                          child: FlatButton(
                            color: Colors.amber,
                            onPressed: () {},
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Icon(Icons.add),
                                  Text('Add A New Product')
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
//                  height: screenHeight * .12,
//                  color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 23),
                            child: Text(
                              'Category',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
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
                                      value: _dropSelectedItem,
                                      onChanged: (val) {
                                        setState(() {
                                          _dropSelectedItem = val;
                                        });
                                      },
                                      items: dropdownItem.map((item) {
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  ListView.builder(
                          itemCount: stockModel.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return (cell(context, index));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
