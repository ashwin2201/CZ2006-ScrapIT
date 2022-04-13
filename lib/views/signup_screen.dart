  import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrap_it/views/login_screen.dart';
import 'package:scrap_it/views/test_screen.dart';
import 'package:scrap_it/views/widgets/text_field_input.dart';

import '../controller/resources/auth_methods.dart';
import '../controller/utils/utils.dart';
import '../pathsAndConsts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  Uint8List _image;
  bool _isLoading = false;
  bool _imageSelected = false;


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void selectImage() async {
    _imageSelected = true;
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = '';

    if (_imageSelected == false) {
      print('no image selected');
      res = await AuthMethods().signUpUser(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
          file: (await rootBundle.load('assets/images/anonymous.png')).buffer.asUint8List()
      );
    } else {
      res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        file: _image,
      );
    }


    // navigate to home screen
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 1),
                  const SizedBox(height: 45),
                  Align(alignment: Alignment.center, child: Text('Welcome to ScrapIT!', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    fontSize: 28,
                    color: text_body,))),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                        radius: 45,
                        backgroundImage: MemoryImage(_image),
                      )
                          : const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/images/anonymous.png'),
                      ),
                      Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                              )
                          )
                      )
                    ],
                  ),
                  const SizedBox(
                      height: 10
                  ),
                  // Text field inputs
                  TextFieldInput(
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  ),
                  const SizedBox(
                      height: 10
                  ),
                  TextFieldInput(
                    hintText: 'Enter your name',
                    textInputType: TextInputType.text,
                    textEditingController: _nameController,
                  ),
                  const SizedBox(
                      height: 10
                  ),
                  TextFieldInput(
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                    isPass: true,
                  ),
                  const SizedBox(
                      height: 24
                  ),

                  // button login
                  InkWell(
                      onTap: signUpUser,
                      child: Container(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        )
                            : const Text("Sign up",
                          style: TextStyle(color: Colors.white),),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            color: Color(0xFF2F7833)
                        ),
                      )
                  ),
                  const SizedBox(
                      height: 12
                  ),
                  Flexible(child: Container(), flex: 3),
                ],
              )
          ),
        )
    );
  }
}