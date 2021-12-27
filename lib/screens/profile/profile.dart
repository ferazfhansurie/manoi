import 'package:flutter/material.dart';
import 'package:manoi/screens/home.dart';
import 'package:manoi/screens/loading.dart';
import 'package:manoi/services/database.dart';
import 'package:provider/provider.dart';
import 'package:manoi/models/user.dart';
import 'package:manoi/services/auth.dart';

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  int manoipoint = 0;
  String settingsname;
  String settingspic;
  String _currentpic;

  @override
  Widget build(BuildContext context) {
    User users = Provider.of<User>(context);

    final AuthService _auth = AuthService();

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: users.uid).userData,
        builder: (context, snapshot) {
          UserData users = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool boxIsScrolled) {
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
                                  icon: Icon(Icons.search,
                                      color: Colors.red[600]),
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
                body: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: CircleAvatar(
                            radius: 53,
                            backgroundColor: Colors.red,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: new SizedBox(
                                  width: 180,
                                  height: 180,
                                  child: (users.pic != 'default')
                                      ? Image.network(
                                          users.pic,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          'assets/user.png',
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    users.name,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  InkWell(
                                      child: Text(
                                        'Show Profile',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red[600],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/setting');
                                      }),
                                ]))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Manoi Point:',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${users.point}',
                            style: TextStyle(
                              color: Colors.red[600],
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Personal Info
                        RawMaterialButton(
                          elevation: 0.0,
                          onPressed: () {
                            Navigator.pushNamed(context, '/shopForm');
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Be A Shop',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Image.asset(
                                  'assets/logo.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Sign Out
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
                                Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}

BoxDecoration ProfilePic() {
  return BoxDecoration(
    border: Border.all(width: 2, color: Colors.grey[600]),
    shape: BoxShape.circle,
    color: Colors.red[100],
  );
}

Widget SettingsBar(
    String settingsname, String settingspic, String buttonFunction) {
  return RawMaterialButton(
    elevation: 0.0,
    onPressed: () => buttonFunction,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            settingsname,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            settingspic,
            height: 35,
            width: 35,
            fit: BoxFit.cover,
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}
