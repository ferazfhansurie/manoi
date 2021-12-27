import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:manoi/screens/loading.dart';
import 'package:provider/provider.dart';
import 'package:manoi/models/user.dart';
import 'package:manoi/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  String _currentName;
  String _currentPic;
  String _currentPoint;
  File _image;

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<User>(context);
    final picker = ImagePicker();

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);

          print('Image Path $_image');
        } else {
          print('no image');
        }
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      if (taskSnapshot.error == null) {
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        setState(() {
          _currentPic = downloadUrl;
          print("Profile Picture uploaded");
        });
      } else {
        print('Error from image repo ${taskSnapshot.error.toString()}');
        throw ('This file is not an image');
      }
    }

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: users.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Edit Information',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  actions: [
                    FlatButton(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await uploadPic(context);
                          await DatabaseService(uid: users.uid).updateUserData(
                              _currentName ?? snapshot.data.name,
                              _currentPic ?? snapshot.data.pic,
                              _currentPoint ?? snapshot.data.point);

                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
                body: Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: new SizedBox(
                                width: 180,
                                height: 180,
                                child: (userData.pic != 'default')
                                    ? Image.network(
                                        userData.pic,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        'assets/user.png',
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                          Container(
                              child: IconButton(
                            icon: Icon(
                              Icons.photo_camera,
                            ),
                            onPressed: getImage,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 350,
                          color: Colors.grey[350],
                          child: TextFormField(
                            initialValue: userData.name,
                            validator: (val) =>
                                val.isEmpty ? 'Please enter your name' : null,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Edit Name',
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                )),
                            onChanged: (val) {
                              setState(() => _currentName = val);
                            },
                          ),
                        ),
                      ]),
                    ])));
          } else {
            return Loading();
          }
        });
  }
}
