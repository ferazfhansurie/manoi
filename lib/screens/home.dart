import 'package:flutter/material.dart';
import 'package:manoi/screens/Genre/beutyGenre.dart';
import 'package:manoi/screens/Genre/electronicGenre.dart';
import 'package:manoi/screens/Genre/foodGenre.dart';
import 'package:manoi/screens/Genre/furnitureGenre.dart';
import 'package:manoi/screens/Genre/healthGenre.dart';
import 'package:manoi/screens/Genre/othersGenre.dart';
import 'package:manoi/screens/Genre/serviceGenre.dart';
import 'package:manoi/services/auth.dart';

import 'package:manoi/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  List<Widget> genre = [
    foodPage(),
    servicePage(),
    electronicPage(),
    healthPage(),
    furniturePage(),
    beutyPage(),
    othersPage(),
  ];

  String genreicon;

  String genrename;

  String genrePage;

  int manoipoint = 0;

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

  final AuthService _auth = AuthService();
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
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(),
              ),
            ];
          },
          body: ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                Widget>[
              Card(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: myBoxDecoration2(),
                          height: 35,
                          width: 125,
                          child: Row(
                            children: [
                              Text(
                                'Manoi Point:',
                                style: TextStyle(
                                  color: Colors.red[600],
                                  letterSpacing: 1.0,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '$manoipoint',
                                style: TextStyle(
                                  color: Colors.red[600],
                                  letterSpacing: 1.0,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GenreTab('assets/food.png', 'Food', '/food', context),
                        SizedBox(
                          width: 3,
                        ),
                        GenreTab('assets/service.png', 'Service', '/service',
                            context),
                        SizedBox(
                          width: 3,
                        ),
                        GenreTab('assets/clothing.png', 'Clothing', '/clothing',
                            context),
                        SizedBox(
                          width: 3,
                        ),
                        GenreTab('assets/electornics.png', 'Electronics',
                            '/electronic', context),
                        SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GenreTab('assets/furniture.png', 'Decor', '/furniture',
                            context),
                        SizedBox(
                          width: 3,
                        ),
                        GenreTab('assets/healthcare.png', 'Health', '/health',
                            context),
                        SizedBox(
                          width: 3,
                        ),
                        GenreTab(
                            'assets/beuty.png', 'Beauty', '/beuty', context),
                        SizedBox(
                          width: 3,
                        ),
                        GenreTab(
                            'assets/others.png', 'Others', '/others', context),
                        SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.grey[300],
                    thickness: 3,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Nearby Shops',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ShopBox(context),
                      ShopBox(context),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 3,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Recommended Shops',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ShopBox(context),
                      ShopBox(context),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 3,
                  ),
                  RawMaterialButton(
                      elevation: 0.0,
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Log Out',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Image.asset(
                                'assets/setting.png',
                                height: 35,
                                width: 35,
                                fit: BoxFit.cover,
                              ),
                            ],
                          )))
                ],
              )
            ])
          ])),
    );
  }
}

BoxDecoration myBoxDecoration3() {
  return BoxDecoration(
    border: Border.all(
      width: 2,
      color: Colors.grey[600],
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(12.0) //         <--- border radius here
        ),
    color: Colors.white,
  );
}

BoxDecoration myBoxDecoration4() {
  return BoxDecoration(
    border: Border.all(
      width: 4,
      color: Colors.grey[600],
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(12.0) //         <--- border radius here
        ),
    color: Colors.white,
  );
}

BoxDecoration myBoxDecoration2() {
  return BoxDecoration(
    border: Border.all(
      width: 2,
      color: Colors.grey[600],
    ),
    borderRadius:
        BorderRadius.all(Radius.circular(6.0) //         <--- border radius here
            ),
  );
}

BoxDecoration myBoxDecoration5() {
  return BoxDecoration(
    border: Border.all(
      width: 2,
      color: Colors.grey[600],
    ),
    image: DecorationImage(
      image: new AssetImage('assets/map.png'),
      fit: BoxFit.fill,
    ),
    borderRadius:
        BorderRadius.all(Radius.circular(6.0) //         <--- border radius here
            ),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 2, color: Colors.grey[600]),
    shape: BoxShape.circle,
    color: Colors.red[100],
  );
}

Widget GenreTab(
    String genrepic, String genrename, String genrePage, BuildContext context) {
  return Column(
    children: [
      RawMaterialButton(
        elevation: 0.0,
        onPressed: () {
          Navigator.pushNamed(context, genrePage);
        },
        shape: CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: myBoxDecoration(),
          height: 50,
          width: 60,
          child: Image.asset(
            genrepic,
            height: 35,
            width: 35,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        genrename,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget ShopBox(BuildContext context) {
  return Column(children: [
    RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/shop');
      },
      child: Container(
        margin: EdgeInsets.symmetric(),
        decoration: myBoxDecoration2(),
        height: 90,
        width: 170,
      ),
    ),
    Container(
      margin: EdgeInsets.only(right: 100),
      child: Text(
        'Shop Name',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(right: 100),
      child: Text(
        'Shop Genre',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w100,
        ),
      ),
    ),
  ]);
}

Widget SearchShops(BuildContext context) {
  return Column(children: [
    Container(
      margin: EdgeInsets.all(20),
      decoration: myBoxDecoration2(),
      height: 135,
      width: 350,
      child: Row(
        children: [
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/shop');
            },
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: myBoxDecoration4(),
              height: 120,
              width: 135,
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Shop Name',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      )),
                  Text('Shop genre'),
                  Text('Shop Desc'),
                ],
              )),
        ],
      ),
    ),
    Divider(
      color: Colors.black,
    ),
  ]);
}
