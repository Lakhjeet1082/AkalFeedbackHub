
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options:FirebaseOptions(
  apiKey: "AIzaSyAxzgxVMAR2B_OIlGYscT7ADu6XM5uXHR4",
  projectId: "akal-hub-10318",
  storageBucket: "akal-hub-10318.appspot.com",
  messagingSenderId: "895079374528",
  appId: "1:895079374528:web:686a4f065e44b945ed9725",
  ));
  }
  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome',
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
