import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manoi/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference manoiCollection =
      Firestore.instance.collection('user');

  Future updateUserData(String name, String pic, int point) async {
    return await manoiCollection.document(uid).setData({
      'name': name,
      'pic': pic,
      'point': point,
    });
  }

// userData list from snapshot
  List<UserData> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return UserData(
          name: doc.data['name'] ?? '',
          pic: doc.data['pic'] ?? '',
          point: doc.data['point'] ?? '0');
    }).toList();
  }

// user data from snapshot

  UserData _userFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        pic: snapshot.data['pic'],
        point: snapshot.data['point']);
  }

//get userdata stream
  Stream<List<UserData>> get user {
    return manoiCollection.snapshots().map(_userListFromSnapshot);
  }

  //get user doc steam
  Stream<UserData> get userData {
    return manoiCollection.document(uid).snapshots().map(_userFromSnapShot);
  }
}
