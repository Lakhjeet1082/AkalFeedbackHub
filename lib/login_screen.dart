import 'package:flutter/material.dart';
import 'package:try_project/dashboard.dart';
import './SignUp_screen.dart';
import './colors.dart';
import './utils.dart';
import './text_field_input.dart';
import './auth_methods.dart';
import './text_field_input.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
    void loginUser() async{
      setState(() {
        _isloading = true;
      });

    String res= await Authmethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if(res=='success'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Dashboard()
        )
        );
    }
    else{
      showSnackBar(res,context);
    }
   setState(() {
        _isloading = false;
      });
    }
    void navigateToSignUp(){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const signUpScreen(),
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
                      onTap: loginUser,
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
                          child: const Text('Log In'),
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
                          onTap: navigateToSignUp,
                           child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              ' Sign Up',
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