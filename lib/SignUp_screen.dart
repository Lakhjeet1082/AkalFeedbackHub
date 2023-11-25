import 'dart:typed_data';
import 'package:flutter/material.dart';
import './login_screen.dart';
import './colors.dart';
import './utils.dart';
import './text_field_input.dart';
import './auth_methods.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen>{
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _bioController = TextEditingController();
   final TextEditingController _userController = TextEditingController();
    Uint8List? _image;
    bool _isloading = false;


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userController.dispose();

  }

 void signupUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await Authmethods().signupUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _userController.text,
        // bio: _bioController.text,
        // file: _image!
        );
    setState(() {
      _isloading = true;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    }
    // else{
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder:(context)=> const ResponsiveLayout
    //       (webScreenLayout:WebScreenLayout(),
    //        mobileScreenLayout: MobileScreenLayout())
    //       )
    //   );
    // }
  }
  void navigateToLoginScreen(){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        )
      );
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child:  Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(flex:2,child: Container()),
             
              const SizedBox(
                height: 64,
              ),
              SizedBox(
                height: 4,
              ),
              TextFieldInput(
                textEditingController: _userController, 
                hintText:"Enter your UserName Address",
                 textInputType: TextInputType.text,
                 ),
                 const SizedBox(
                  height: 24,
                 ),
              TextFieldInput(
                textEditingController: _emailController, 
                hintText:"Enter your Email Text",
                 textInputType: TextInputType.emailAddress,
                 ),
                 const SizedBox(
                  height: 24,
                 ),
                 TextFieldInput(
                  textEditingController: _passwordController,
                   hintText: "Enter your Password",
                    textInputType: TextInputType.text,
                    isPass: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                   
                    InkWell(
                      onTap: () async {
                      String res =  await Authmethods().signupUser(email: _emailController.text, password: _passwordController.text, username: _userController.text);
                      print(res);
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: blueColor
                          ),
                          child: const Text('Sign Up'),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text('Do not have Account'),
                         ),
                         GestureDetector(
                          onTap: navigateToLoginScreen,
                           child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              'Log In',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                           ),
                         )
                        ],
                      )
            ]),
        ),
        ),
    );
  }
}