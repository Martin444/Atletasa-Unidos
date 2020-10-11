import 'package:atletasunidos/Views/CustomUser/HomePage.dart';
import 'package:atletasunidos/Widgets/const.dart';
import 'package:atletasunidos/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDecide extends StatefulWidget {
  Users user; 

  UserDecide({this.user});
  @override
  _UserDecideState createState() => _UserDecideState();
}

class _UserDecideState extends State<UserDecide> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: widget.user.uid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.hasData){
          snapshot.data.docs.forEach((e) {
              widget.user = Users(
                    uid: e.data()['uid'],
                    name: e.data()['name'],
                    email: e.data()['email'],
                    doctor: e.data()['doctor'] == null ? 1 : e.data()['doctor'],
                    photoURL: e.data()['photoURL'],
                    age: e.data()['age'],
                    numeroDocumento: e.data()['Ndocument'],
                    telefono: e.data()['telefono'],
                    peso: e.data()['peso'],
                    tokenID: e.data()['tokenID']
                    );
           });

           switch (widget.user.doctor) {
             case 1:
                return HomePage(user: widget.user);
               break;
             default:
           }
        } else {
          return Scaffold(
            backgroundColor: blackPrimary,
            body: Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(redPrimary),
                ),
            ),
          );
        }
      }
    );
  }
}