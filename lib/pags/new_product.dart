import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class StockModel {
  String name;
  String details;
  double rating;
  String price;
  String avalable;
  double numRating;
  bool zwitch;
  double sold;

  StockModel({this.sold,this.name, this.avalable, this.details, this.price, this.rating,this.zwitch = true,this.numRating});
}

class _NewProductState extends State<NewProduct> {
  List<String> dropdownItem = ['Desert', 'Lunch', 'Breakfast', 'Dinner'];

  List<StockModel> stockModel = List<StockModel>();

  _NewProductState() {
    stockModel.add(StockModel(
        name: 'Coke',
        sold : 69,
        avalable: '23',
        details: 'Great Drink',
        price: '1.32',
        numRating: 100.0,
        rating: 3.0));
    stockModel.add(StockModel(
        name: 'Pepsi',
        avalable: '13',
        sold : 44,
        details: 'Simple Drink',
        price: '2.32',
        numRating: 200.0,
        rating: 3.5));
    stockModel.add(StockModel(
        name: 'Sprite',
        sold : 32,
        avalable: '33',
        details: 'Super Great Drink',
        price: '3.32',
        numRating: 300.0,
        rating: 5.0));
    stockModel.add(StockModel(
        name: 'Mountain Dew',
        avalable: '43',
        sold : 123,
        details: 'Normal Drink',
        price: '4.32',
        numRating: 100.0,
        rating: 3.0));
    stockModel.add(StockModel(
        name: 'Fanta',
        avalable: '53',
        sold : 619,
        numRating: 100.0,
        details: 'Shitty Drink',
        price: '5.32',
        rating: 1.5));
  }

  String _dropSelectedItem = 'Desert';



  Widget cell(BuildContext ctx, int index) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: stockModel[index].zwitch?Container(
//        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: DottedBorder(
            strokeWidth: .3,
            color: Colors.grey,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(4.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      //largethings
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 2),
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
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    stockModel[index].details,
                                    style: TextStyle(
                                      color: Colors.grey[600]
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    SmoothStarRating(
                                      isReadOnly: true,
                                      starCount: 5,
                                      rating: stockModel[index].rating,
                                      allowHalfRating: true,
                                      size: 15,
                                      color: Colors.grey[500],
                                      borderColor: Colors.grey,
                                      spacing: 1.0,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      '(${stockModel[index].numRating.round().toString()} ratings)',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 10
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20,),
                              Text(
                                '\$${stockModel[index].price}',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Transform.scale(
                                scale: 1.3,
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
                    const MyDot(color: Colors.grey,height: .5),
                    Container(
                      //menu
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              text: 'Purchase : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                              ),
                              children: [
                                TextSpan(
                                  text: stockModel[index].avalable,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16
                                  )
                                )
                              ]
                            )
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
        ),
      ):Container(
//        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: DottedBorder(
            strokeWidth: .3,
            color: Colors.grey,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10,right: 20),
                    height: 70,
                    width: 250,
                    child: Center(
                      child: Text(
                        'OUT OF STOCK',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          //largethings
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 2),
                                child: Opacity(
                                  opacity: .2,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/visa.png'),
                                    radius: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Opacity(
                                  opacity: .2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        stockModel[index].name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        child: Text(
                                          stockModel[index].details,
                                          style: TextStyle(
                                              color: Colors.grey[600]
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SmoothStarRating(
                                            isReadOnly: true,
                                            starCount: 5,
                                            rating: stockModel[index].rating,
                                            allowHalfRating: true,
                                            size: 15,
                                            color: Colors.grey[500],
                                            borderColor: Colors.grey,
                                            spacing: 1.0,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            '(${stockModel[index].numRating.round().toString()} ratings)',
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 10
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20,),
                                  Opacity(
                                    opacity: .2,
                                    child: Text(
                                      '\$${stockModel[index].price}',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
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
                                flex: 1,
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0)
                                    )
                                  ),
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Sold : ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          ),
                                          children: [
                                            TextSpan(
                                                text: stockModel[index].sold.round().toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  child: FlatButton(
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
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: ()=> Navigator.pop(context),
        ),
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
              onPressed: (){},
            ),
          ),
        ],
      ),
      body: Container(
          //main
          color: Colors.white,
          height: screenHeight,
          width: screenWidth,
          child: Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
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
                              'Driver license number is needed if driver has registered a car. For bicycle it is not necessary.',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600]
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: SizedBox(height: 3,width: 325,
                    child: Container(color: Colors.amber,),),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                      //Add new product
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .91,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Colors.amber,
                            onPressed: () {},
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Icon(Icons.add),
                                  Text('ADD A NEW PRODUCT')
                                ],
                              ),
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
        ));
  }
}

class MyDot extends StatelessWidget {
  final double height;
  final Color color;
  const MyDot({this.height = 1,this.color = Colors.grey});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,BoxConstraints constraints){
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 2.5;
        final dashHeight = height;
        final dashCount = (boxWidth / (2*dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_){
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}