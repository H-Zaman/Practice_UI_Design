import 'package:examflutterapp/pags/models/stockitems.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final StockModel stockModel;
  final Function delete;
  CustomTile({this.stockModel,this.delete});
  bool zwitch = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                            '"${stockModel.name}"',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              stockModel.details
                            ),
                          ),
                          Text(
                            'Rating ${stockModel.rating}'
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$${stockModel.price}',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            value: zwitch,
                            onChanged: (_){
                              zwitch = _;
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
                      'Available: ${stockModel.avalable}'
                    ),
                    FlatButton(
                      onPressed: (){
                        zwitch ? print('true') : print('false');
                      },
                      color: Colors.white,
                      child: Row(
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
    );
  }
}
