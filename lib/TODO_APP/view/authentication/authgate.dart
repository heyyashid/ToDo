import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/TODO_APP/view/authentication/loginpage.dart';
import 'package:todo/TODO_APP/view/screens/homescreen.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if(snapshot.connectionState==ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
       }
       else if(snapshot.hasError){
        return Text("error=${snapshot.error}");
       }else if(snapshot.hasData){
        return Homescreen();
       }else{
        return Loginpage();
       }
     },);
  }
}