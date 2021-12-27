import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red[600],
        child: Center(
          child: SpinKitChasingDots(
            color: Colors.white,
            size: 50,
          ),
        ));
  }
}
