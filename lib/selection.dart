import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  final Function toggleView;
  Selection({this.toggleView});

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[600],
        body: Container(
          margin: EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Text('Welcome to Manoi!',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      RawMaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/auth');
                          },
                          child: Image.asset(
                            'assets/user.png',
                            height: 60,
                            width: 60,
                          )),
                      Text('User',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      RawMaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/auths');
                          },
                          child: Image.asset(
                            'assets/logowhite.png',
                            height: 60,
                            width: 60,
                          )),
                      Text('Shop',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
