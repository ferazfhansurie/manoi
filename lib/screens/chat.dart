import 'package:flutter/material.dart';
import 'package:manoi/screens/home.dart';

class chatPage extends StatefulWidget {
  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  forceElevated: boxIsScrolled,
                  title: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 40,
                        decoration: myBoxDecoration3(),
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.red[600]),
                              labelText: 'What are you searching for?'),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.red[600],
                  expandedHeight: 100,
                  flexibleSpace: FlexibleSpaceBar(),
                ),
              ];
            },
            body: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 150),
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Messages',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              )
            ])));
  }
}
