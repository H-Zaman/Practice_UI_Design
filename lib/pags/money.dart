import 'package:dotted_border/dotted_border.dart';
import 'package:examflutterapp/pags/Card.dart';
import 'package:examflutterapp/pags/models/withdraw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {

  String money;

  List<WithdrawClass> withdraws = [
    WithdrawClass(icon: 'master',date: '12/02/1996',order: 'first order',money: '200'),
    WithdrawClass(icon: 'visa',date: '12/02/2002',order: 'second order',money: '400'),
    WithdrawClass(icon: 'master',date: '12/02/2006',order: 'third order',money: '600'),
    WithdrawClass(icon: 'visa',date: '12/02/2010',order: 'fourth order',money: '800')
  ];

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: ()=> Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Withdrawal History',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.sort),
              color: Colors.black,
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                //Main body whole screen
                height: screenHeight,
                width: screenWidth,
                color: Colors.white,
                //all body elements
                child: Column(
                  children: <Widget>[
                    //balance
                    Container(
                      height: screenHeight * .11,
                      width: screenWidth,
//                color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Balance',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$234.30',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'Total Withdraw',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '\$33,346.50',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    //withdraw amount
                    Container(
                      width: screenWidth,
                      height: screenHeight * .2,
//                color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Add Amount'
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                            child: DottedBorder(
                              color: Colors.black,
                              strokeWidth: 1,
                              borderType: BorderType.RRect,
                              child: TextFormField(
                                textAlign: TextAlign.center,
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
                                    money = val;
                                  });
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 320,
                              height: 60,
                              child: FlatButton(
                                onPressed: (){
                                  print(money);
                                },
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Center(
                                  child: Text(
                                    'WITHDRAW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //history
                    Container(
                      height: screenHeight * .57,
                      width: screenWidth,
//                      color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Withdraw History',
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'View All'
                                ),
                              ),
                              SizedBox(width: 10,)
                            ],
                          ),
                          SingleChildScrollView(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: withdraws.map((withdraw){
                                      return WithDrawCard(withdraw: withdraw);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 320,
                height: 65,
                child: FlatButton(
                  onPressed: (){
                    print('Load More');
                  },
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Center(
                    child: Text(
                      'LoadMore',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
