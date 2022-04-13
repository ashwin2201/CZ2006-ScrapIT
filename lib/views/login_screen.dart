import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/views/widgets/text_field_input.dart';
import '../controller/resources/auth_methods.dart';
import '../controller/utils/utils.dart';
import '../pathsAndConsts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    bool verify = _auth.currentUser.emailVerified;
    print(verify);
    if (res == "success" && verify== true) {
      //
      print(res);
      showSnackBar(res, context);
      Navigator.pushNamed(context, '/screen-0');
    }
    else if (verify==false){
      Navigator.pushNamed(context, '/verify');
    }
    else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(res, context);
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 1),
                  Center(
                    child: Image.asset(
                      ("assets/Scrapit_logo.png"),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.center,
                      child: Text('Welcome back!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            fontSize: 28,
                            color: text_body,
                          ))),
                  const SizedBox(height: 20),
                  TextFieldInput(
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  ),
                  const SizedBox(height: 10),
                  TextFieldInput(
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                    isPass: true,
                  ),
                  const SizedBox(height: 20),
                  // button login
                  InkWell(
                      onTap: loginUser,
                      child: Container(
                        child: const Text(
                          'Log in',
                          style: TextStyle(color: Colors.white),
                        ),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            color: Color(0xFF2f7833)),
                      )),
                  const SizedBox(height: 12),
                  Flexible(child: Container(), flex: 1),

                  // Transitioning to signing up
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        child: const Text("Don't have an account? "),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        )),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/sign-up'),
                      child: Container(
                          child: const Text("Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green, decoration: TextDecoration.underline)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          )),
                    ),
                  ]),
                  SizedBox(height: 12),
                ],
              )),
        ));
  }
}
