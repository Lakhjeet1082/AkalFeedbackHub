import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'student.dart' as model;
import './storage_methods.dart';

class Authmethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  Future<String> signupUser({
    required String email,
    required String password,
    required String username

  })
  async{
    String res= "Some error occured";
    try{
      if(email.isNotEmpty|| password.isNotEmpty|| username.isNotEmpty){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);

        res= 'success';
      }
    }
    catch(err){
      res= err.toString();
    }
    return res;
  }
  Future<String>loginUser(
    {
      required String email,
      required String password
    }
  )async{
    String res= "Some error Ocurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res='success';
      }
      else{
        res = 'Please fill all the required fields';
      }
    }
    catch(err){
      res= err.toString();
    }
    return res;
  }
}