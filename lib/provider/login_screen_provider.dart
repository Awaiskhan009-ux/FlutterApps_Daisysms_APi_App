import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthProvider extends ChangeNotifier{
final FirebaseAuth _auth =FirebaseAuth.instance;
User? user;

//signUp 
Future<void> signUp(String email,String password) async{
  try{
    UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);

    user =result.user;
    notifyListeners();
  }
  catch(e){
    print("signUp Error: $e");
    rethrow;
  }
}

//LogIn
Future<void> login(String email, String password) async{
  try {
    UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);

    user =result.user;
    notifyListeners();
  }
  catch(e){
    print("Login Error$e");
    rethrow;
  }
}

//signOut

Future<void> logout() async{
  await _auth.signOut();
  user=null;
  notifyListeners();
}


}

