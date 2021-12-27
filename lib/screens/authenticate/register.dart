import 'package:flutter/material.dart';
import 'package:manoi/services/auth.dart';
import 'package:flutter/services.dart';

class register extends StatefulWidget {
  final Function toggleUser;
  register({this.toggleUser});
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[600],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/logowhite.png',
              height: 100,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Please Register To Continue!!',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      )),
                  Text('Enter your Email Address and Password to Continue',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Email Address is invalid' : null,
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            validator: (val) => val.length < 8
                                ? 'Password must be more than 8 characters long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ),
                        RaisedButton(
                            color: Colors.red[900],
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                print(email);
                                if (result == null) {
                                  setState(() =>
                                      error = 'invalid email or password');
                                }
                              }
                            }),
                        Text(error,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 60,
                        ),
                      ])),
                  Text('Already have an account?',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      )),
                  InkWell(
                    child: Text('login here',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    onTap: () {
                      widget.toggleUser();
                    },
                  )
                ],
              ))
        ]));
  }
}
