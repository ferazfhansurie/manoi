import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manoi/models/user.dart';
import 'package:manoi/models/shops.dart';
import 'package:manoi/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _codeController = TextEditingController();

  //create user object based on firebase user
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//create shop object based on firebase user
  Shop _shopFromFireBaseUser(FirebaseUser shop) {
    return shop != null ? Shop(uid: shop.uid) : null;
  }

//auth change shop stream
  Stream<Shop> get shop {
    return _auth.onAuthStateChanged.map(_shopFromFireBaseUser);
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /*sign in shop
  Future signInShopWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser shop = result.shop;
      return _shopFromFireBaseUser(shop);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

  //sign in user
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  /*register shop
  Future registerShopWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser shop = result.shop;

      await DatabaseService(uid: shop.uid)
          .updateUserData('New supporter', 'default', 0);

      return _userFromFireBaseUser(shop);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  */

  //register with phone number
  Future registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid)
          .updateUserData('New supporter', 'default', 0);

      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
