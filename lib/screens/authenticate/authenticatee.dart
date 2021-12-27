import 'package:flutter/material.dart';
import 'package:manoi/screens/authenticate/register.dart';
import 'package:manoi/screens/authenticate/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInUser = true;

  void toggleUser() {
    setState(() => showSignInUser = !showSignInUser);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInUser) {
      return signIn(toggleUser: toggleUser);
    } else {
      return register(toggleUser: toggleUser);
    }
  }
}
