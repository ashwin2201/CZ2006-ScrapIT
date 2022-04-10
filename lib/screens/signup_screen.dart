import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrap_it/resources/auth_methods.dart';
import 'package:scrap_it/widgets/text_field_input.dart';

import '../utils/utils.dart';

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


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      file: _image,
    );
    // navigate to home screen
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, '/home');
    }
    else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              const SizedBox(height: 64),
              Stack(
                children: [
                  _image != null
                  ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image),
                  )
                  : const CircleAvatar(
                    radius: 64,
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
                height: 24
              ),
              // Text field inputs
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24
              ),
              TextFieldInput(
                hintText: 'Enter your name',
                textInputType: TextInputType.text,
                textEditingController: _nameController,
              ),
              const SizedBox(
                height: 24
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