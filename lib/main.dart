import 'package:flutter/material.dart';
import 'package:manoi/models/user.dart';
import 'package:manoi/screens/authenticate/authenticateShop.dart';
import 'package:manoi/screens/authenticate/authenticatee.dart';
import 'package:manoi/screens/chat.dart';
import 'package:manoi/screens/pinnedPage.dart';
import 'package:manoi/screens/profile/profile.dart';
import 'package:manoi/screens/shop/shopForm.dart';
import 'package:manoi/screens/shop/shopPage.dart';
import 'package:manoi/screens/home.dart';
import 'package:manoi/screens/Genre/foodGenre.dart';
import 'package:manoi/screens/Genre/serviceGenre.dart';
import 'package:manoi/screens/Genre/clothingGenre.dart';
import 'package:manoi/screens/Genre/beutyGenre.dart';
import 'package:manoi/screens/Genre/electronicGenre.dart';
import 'package:manoi/screens/Genre/othersGenre.dart';
import 'package:manoi/screens/Genre/healthGenre.dart';
import 'package:manoi/screens/Genre/furnitureGenre.dart';
import 'package:manoi/screens/wrapper.dart';
import 'package:manoi/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:manoi/screens/profile/settingForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manoi',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/wrap',
        routes: {
          '/wrap': (context) => Wrapper(),
          '/auth': (context) => Authenticate(),
          '/auths': (context) => AuthenticateShop(),
          '/home': (context) => Home(),
          '/chat': (context) => chatPage(),
          '/pin': (context) => pinPage(),
          '/profile': (context) => profilePage(),
          '/shop': (context) => shopPage(),
          '/food': (context) => foodPage(),
          '/service': (context) => servicePage(),
          '/electronic': (context) => electronicPage(),
          '/health': (context) => healthPage(),
          '/furniture': (context) => furniturePage(),
          '/clothing': (context) => clothingPage(),
          '/beuty': (context) => beutyPage(),
          '/others': (context) => othersPage(),
          '/setting': (context) => SettingsForm(),
          '/shopForm': (context) => shopForm(),
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    HomePage(),
    chatPage(),
    pinPage(),
    profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset(10, 10)
          //     )
          //   ]
          // ),
          margin: EdgeInsets.only(bottom: 20),
          child: new TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(
                icon: Icon(Icons.chat),
              ),
              Tab(
                icon: Image.asset(
                  'assets/logoblack.png',
                  fit: BoxFit.cover,
                  height: 25,
                  width: 25,
                ),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red[600],
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
