// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   String _errorMessage = '';

//   void _login() {
//     // Implement your login logic here
//     // For example, you can validate the email and password
//     // If login is successful, navigate to the next screen
//     // If login fails, display an error message
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _errorMessage = ''; // Clear previous error message
//                 });

//                 // Validate email and password
//                 // For example:
//                 // if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//                 //   setState(() {
//                 //     _errorMessage = 'Please enter both email and password.';
//                 //   });
//                 // } else {
//                 //   _login(); // Call your login function
//                 // }
                
//                 // For this example, I'm just navigating to the next screen without validation
//                 Navigator.pushReplacementNamed(context, '/dashboard');
//               },
//               child: Text('Login'),
//             ),
//             SizedBox(height: 10),
//             Text(
//               _errorMessage,
//               style: TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(18),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: RichText(
                  text: const TextSpan(
                      text: 'Akal University',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                    TextSpan(
                        text: ' Talwandi Sabo',
                        style: TextStyle(
                          color: Colors.black87,
                        ))
                  ])),
            ),
            SizedBox(
              width: size.width,
              height: size.height * .3,
              child: Image.asset('assets/university.webp'),
            ),
            Container(
              height: size.height * .3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    top: 10,
                    left: 20,
                    child: Text(
                      'Login Here',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: const TextField(
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'example@gmail.com',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 120,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: const TextField(
                                  obscureText: true,
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    letterSpacing: 1.4,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '...........',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 180,
                      left: 20,
                      child: SizedBox(
                        width: size.width * .8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Forgot Details',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: -30,
                    right: 30,
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.amber,
                            ],
                            stops: [
                              0.0,
                              1.0
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/right-arrow.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
