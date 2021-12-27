import 'package:flutter/material.dart';
import 'package:manoi/screens/home.dart';
import 'package:manoi/screens/loading.dart';
import 'package:manoi/services/auth.dart';
import 'package:flutter/services.dart';

class signInShop extends StatefulWidget {
  final Function toggleShop;
  signInShop({this.toggleShop});
  @override
  _signInShopState createState() => _signInShopState();
}

class _signInShopState extends State<signInShop> {
  final AuthService _auth = AuthService();
  bool loading = false;

//text field state
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.red[600],
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Text('Welcome Please Sign In Shop!!',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          )),
                      Text('Enter your Email Adress and Password to Continue',
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
                                validator: (val) => val.isEmpty
                                    ? 'Email Address is invalid'
                                    : null,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              color: Colors.white,
                              child: TextFormField(
                                obscureText: true,
                                validator: (val) => val.length < 8
                                    ? 'Password must be more than 8 characters long'
                                    : null,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                ),
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
                                    setState(() => loading = true);
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    print(email);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'invalid email or password';
                                      });
                                    }
                                  }
                                }),
                            Text(error,
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 40,
                            ),
                          ])),
                      Text('Dont have an account?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          )),
                      InkWell(
                        child: Text('register here',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        onTap: () {
                          widget.toggleShop();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Are you a User?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          )),
                      InkWell(
                        child: Text('sign in as User here',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ))
            ]));
  }
}
