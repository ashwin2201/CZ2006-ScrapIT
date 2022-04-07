// import 'package:flutter/material.dart';
// import 'package:scrap_it/resources/auth_methods.dart';
// import 'package:scrap_it/utils/utils.dart';
// import 'package:scrap_it/widgets/text_field_input.dart';
//
// class LoginScreen extends StatefulWidget {
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }
//
//   void loginUser() async {
//     String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
//     if (res == "success") {
//       //
//       Navigator.pushNamed(context, '/home');
//     } else {
//       showSnackBar(res, context);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Flexible(child: Container(), flex: 2),
//               const SizedBox(height: 64),
//               TextFieldInput(
//                 hintText: 'Enter your email',
//                 textInputType: TextInputType.emailAddress,
//                 textEditingController: _emailController,
//               ),
//               const SizedBox(
//                 height: 24
//               ),
//               TextFieldInput(
//                 hintText: 'Enter your password',
//                 textInputType: TextInputType.text,
//                 textEditingController: _passwordController,
//                 isPass: true,
//               ),
//               const SizedBox(
//                 height: 24
//               ),
//               // button login
//               InkWell(
//                 onTap: loginUser,
//                 child: Container(
//                   child: const Text(
//                     'Log in',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   decoration: const ShapeDecoration(
//                     shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                     color: Color(0xFF2f7833)
//                   ),
//                 )
//               ),
//               const SizedBox(
//                 height: 12
//               ),
//               Flexible(child: Container(), flex: 2),
//
//               // Transitioning to signing up
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     child: const Text("Don't have an account?"),
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 8,
//                     )
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                     child: const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       )
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 8,
//                     )
//                   ),
//                   ),
//
//                 ]
//               )
//             ],
//           )
//         ),
//       )
//     );
//   }
// }