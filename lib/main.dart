import 'package:examflutterapp/pags/all_products.dart';
import 'package:examflutterapp/pags/car.dart';
import 'package:examflutterapp/pags/money.dart';
import 'package:examflutterapp/pags/new_product.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context)=> MyHomePage(),
        '/1' : (context)=> NewProduct(),
        '/2' : (context)=> Car(),
        '/3' : (context)=> Money(),
        '/4' : (context)=> AllProducts(),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/1');
              },
              child: Text('Page 1'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/2');
              },
              child: Text('Page 2'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/3');
              },
              child: Text('Page 3'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/4');
              },
              child: Text('Page 4'),
            )
          ],
        ),
      ),
    );
  }
}
