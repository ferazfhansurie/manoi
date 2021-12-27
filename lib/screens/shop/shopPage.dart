import 'package:flutter/material.dart';
import 'package:manoi/screens/home.dart';
import 'package:manoi/models/shops.dart';

class shopPage extends StatefulWidget {
  @override
  _shopPageState createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
            controller: _scrollController,
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
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(),
                ),
              ];
            },
            body: ListView(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.grey[300],
                          thickness: 3,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Show more >'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 65),
                          decoration: myBoxDecoration2(),
                          height: 35,
                          width: 250,
                          child: FlatButton(
                              onPressed: () {}, child: Text('Message Shop')),
                        )
                      ],
                    )),
                Divider(
                  color: Colors.grey[300],
                  thickness: 3,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Location',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        decoration: myBoxDecoration5(),
                        height: 215,
                        width: 325,
                        child: RawMaterialButton(
                          elevation: 0.0,
                          onPressed: () {},
                          shape: CircleBorder(),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: myBoxDecoration(),
                            height: 50,
                            width: 60,
                            child: Image.asset(
                              'assets/logowhite.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          'No 23 Jalan 13 desa subang permai',
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 3,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Shop Name',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(),
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: myBoxDecoration2(),
                              width: 100.0,
                              child: Card(
                                child: Text('Category'),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Product',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(),
                        height: 200.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: myBoxDecoration2(),
                              width: 200.0,
                              child: Card(
                                child: Text('Product'),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(),
                    height: 260.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 35),
                          decoration: myBoxDecoration2(),
                          width: 370.0,
                          child: Card(
                            child: Text('Reviews'),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65),
                    decoration: myBoxDecoration2(),
                    height: 35,
                    width: 250,
                    child: Text('See All Reviews'),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 3,
                  ),
                ]),
                shopInfo(),
                shopInfo(),
              ],
            )));
  }
}

Widget shopInfo() {
  return Column(
    children: [
      Container(
          margin: EdgeInsets.symmetric(),
          child: Row(children: [
            Column(
              children: [
                Text(
                  'Operating Hours',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('8.00 am - 10.00 pm')
              ],
            ),
            Spacer(),
            Icon(
              Icons.navigate_next,
              size: 50,
            )
          ])),
      Divider(
        color: Colors.black,
        thickness: 1,
      ),
    ],
  );
}
