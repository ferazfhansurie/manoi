import 'package:flutter/material.dart';
import 'package:manoi/main.dart';
import 'package:manoi/models/user.dart';
import 'package:manoi/selection.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //home or authenticate

    if (user == null) {
      return Selection();
    } else {
      return Home();
    }
  }
}
