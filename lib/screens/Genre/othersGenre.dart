import 'package:flutter/material.dart';
import 'package:manoi/screens/home.dart';

class othersPage extends StatefulWidget {
  @override
  _othersPageState createState() => _othersPageState();
}

class _othersPageState extends State<othersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red[600],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 350,
              height: 40,
              decoration: myBoxDecoration3(),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.red[600]),
                    labelText: 'Search Other Shops'),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 150),
            child: Text(
              'Others',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          SearchShops(context),
          SearchShops(context),
        ],
      ),
    );
  }
}
