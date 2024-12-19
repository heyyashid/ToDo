

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
    final FirebaseAuth _auth =  FirebaseAuth.instance;

      Future <UserCredential?> signin(String email, String password,BuildContext context)async{
            try{  
          final credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
        if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:Text("Login Succefull"),
                        backgroundColor: Colors.purple,
                         ));
        }return credential;

} 
on FirebaseAuthException{
   if(context.mounted){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:Text("invalid credentails!"),
                        backgroundColor: Colors.purple,
                         ));
   }
}catch(e){
  print(e);
} return null;
}



      Future <UserCredential?> signup(String email, String password,BuildContext context)async{
            try{  
          final credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:Text("Register Succefull"),
                        backgroundColor: Colors.purple,
                         ));
        }return credential;

} 
on FirebaseAuthException{
   if(context.mounted){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:Text("invalid credentails!"),
                        backgroundColor: Colors.purple,
                         ));
   }
}catch(e){
  print(e);
}  return null;
}



// Future<UserCredential?>signup(String email,String password)async{
//   final credential = await instance.createUserWithEmailAndPassword(email: email, password: password);
//   return credential;
  
// }

Future<void>signout()async{
  await _auth.signOut();
}


}

class FirestoreServices {
  
  Future createData(String title,String desc)async{
    final data =  FirebaseFirestore.instance.collection('user');
    return data.add({
      'title':title,
      'desc':desc,
      'checkbox':false,
    });

  }
   Future updateData(String title,String desc,String docId)async{
    final data =  FirebaseFirestore.instance.collection('user');
    return data.doc(docId).update({
      'title':title,
      'desc':desc,
    });

  }
   Future deletedata(String docId)async{
    final data =  FirebaseFirestore.instance.collection('user');
    return data.doc(docId).delete();

  }
}