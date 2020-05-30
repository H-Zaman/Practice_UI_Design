import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  @override
  _MoneyState createState() => _MoneyState();
}


class WithdrawClass{
  String icon;
  String date;
  String order;
  String money;
  WithdrawClass({this.icon,this.date,this.order,this.money});
}

class _MoneyState extends State<Money> {
  int _selectedIndex = 0;
  String money;
  String path;

  List<WithdrawClass> items =  List<WithdrawClass>();
  _MoneyState() {
    items.add( WithdrawClass(icon: 'master',date: '12/02/1996',order: 'first order',money: '200'));
    items.add( WithdrawClass(icon: 'visa',date: '12/02/2002',order: 'second order',money: '400'));
    items.add( WithdrawClass(icon: 'master',date: '12/02/2006',order: 'third order',money: '600'));
    items.add( WithdrawClass(icon: 'visa',date: '12/02/2010',order: 'fourth order',money: '800'));
    items.add( WithdrawClass(icon: 'master',date: '12/02/1996',order: 'first order',money: '200'));
    items.add( WithdrawClass(icon: 'visa',date: '12/02/2002',order: 'second order',money: '400'));
    items.add( WithdrawClass(icon: 'master',date: '12/02/2006',order: 'third order',money: '600'));
    items.add( WithdrawClass(icon: 'visa',date: '12/02/2010',order: 'fourth order',money: '800'));
  }

  Widget cell(BuildContext ctx, int index) {
    if(items[index].icon == 'master'){
      path = 'assets/master.jpg';
    }
    else{
      path = 'assets/visa.png';
    }
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: _selectedIndex==index?Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(path),
            ),
            title: Text(
              items[index].date,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            subtitle: Text(
                'Order #${items[index].order}'
            ),
            trailing: Text(
              '\$${items[index].money}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),
            ),
          ),
        ):Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(path),
            ),
            title: Text(
              items[index].date,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            subtitle: Text(
                'Order #${items[index].order}'
            ),
            trailing: Text(
              '\$${items[index].money}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {

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
            Container(
              margin: EdgeInsets.only(top:10),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    //balance
                    Container(
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
                      margin: EdgeInsets.only(bottom:10,top:10),
                      width: screenWidth,
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
                              color: Colors.grey,
                              strokeWidth: .3,
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
                          Container(
                            margin: EdgeInsets.only(bottom:10,top:10),
                            child: Center(
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
                            ),
                          )
                        ],
                      ),
                    ),
                    //history
                    Container(
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
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  ListView.builder(
                                itemCount: items.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return WidgetListAnimator(cell(context, index));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //load more
                    Container(
                      margin: EdgeInsets.only(top:5),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Ignore this part, just an animator
class Animator extends StatefulWidget {
  final Widget child;
  final Duration time;
  Animator(this.child, this.time);
  @override
  _AnimatorState createState() => _AnimatorState();
}
class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  Timer timer;
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 290), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - animation.value) * 20),
            child: child,
          ),
        );
      },
    );
  }
}
Timer timer;
Duration duration = Duration();
wait() {
  if (timer == null || !timer.isActive) {
    timer = Timer(Duration(microseconds: 120), () {
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: 50);
  return duration;
}
class WidgetListAnimator extends StatelessWidget {
  final Widget child;
  WidgetListAnimator(this.child);
  @override
  Widget build(BuildContext context) {
    return Animator(child, wait());
  }
}