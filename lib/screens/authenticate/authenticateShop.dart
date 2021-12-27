import 'package:flutter/material.dart';
import 'package:manoi/screens/authenticate/signInShop.dart';
import 'package:manoi/screens/authenticate/registerShop.dart';

class AuthenticateShop extends StatefulWidget {
  @override
  _AuthenticateShopState createState() => _AuthenticateShopState();
}

class _AuthenticateShopState extends State<AuthenticateShop> {
  bool showSignInShop = true;

  void toggleShop() {
    setState(() => showSignInShop = !showSignInShop);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInShop) {
      return signInShop(toggleShop: toggleShop);
    } else {
      return registerShop(toggleShop: toggleShop);
    }
  }
}
