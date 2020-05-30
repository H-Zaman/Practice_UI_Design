import 'package:examflutterapp/pags/models/withdraw.dart';
import 'package:flutter/material.dart';

class WithDrawCard extends StatelessWidget {
  final WithdrawClass withdraw;
  WithDrawCard({this.withdraw});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          child: Center(
            child: Text(
              withdraw.icon
            ),
          ),
        ),
        title: Text(
          withdraw.date,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        subtitle: Text(
          'Order #${withdraw.order}'
        ),
        trailing: Text(
          '\$${withdraw.money}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),
        ),
      ),
    );
  }
}
