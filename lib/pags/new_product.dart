import 'package:flutter/material.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              Text(
                'All Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              Text(' product details  product details  product details  product details  product details  product details  product details  product details  product details ',
              overflow: TextOverflow.visible,
                style: TextStyle(
                fontSize: 16,
              ),)
            ],
          ),
        )
      ),
    );
  }
}