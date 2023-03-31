import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_assesment/controllers/auth_controller.dart';
import 'package:intern_assesment/models/sign_in_model.dart';
import 'package:intern_assesment/routes/route_helper.dart';
import 'package:intern_assesment/utils/app_color_constants.dart';
import 'package:intern_assesment/widgets/custom_snack_bar_widget.dart';

import '../widgets/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedAuthOption = 'Sign Up';
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void registrationOrLogin(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Enter Password", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar('Enter Password', title: 'Password');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Enter Valid Email', title: 'Email');
      } else {
        print('Email : ${email}  Password: ${password}');
        SignInModel signInModel = SignInModel(email: email, password: password);

        if (_selectedAuthOption == 'Sign Up') {
          authController.registration(signInModel).then(
            (status) {
              if (status.isSuccess) {
                showCustomSnackBar("Sign up successful", title: "Successful", isError: false);
                Get.toNamed(RouterHelper.getInitial());
              } else {
                showCustomSnackBar(status.message);
              }
            },
          );
        } else if (_selectedAuthOption == 'Sign In') {
          authController.login(signInModel).then((status) {
            if (status.isSuccess) {
              showCustomSnackBar("Login succesful", title: "Succesfull", isError: false);
              Get.toNamed(RouterHelper.getInitial());
            } else {
              showCustomSnackBar(status.message);
            }
          });
        }
      }
    }

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.appBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text Section
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Welcome, ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Text('to sing ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 34,
                              color: Color.fromARGB(239, 255, 255, 255),
                            )),
                        SizedBox(
                          height: 3,
                        )
                      ],
                    ),
                  ],
                ),
                const Text('in continue ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 34,
                      color: Color.fromARGB(239, 255, 255, 255),
                    )),
                const SizedBox(height: 50),
                //SignUp or Sign In Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: GestureDetector(
                        onTap: () {
                          //activate sign in
                          setState(() {
                            _selectedAuthOption = 'Sign In';
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 180,
                          color: const Color(0xff1766c3),
                          child: _selectedAuthOption == 'Sign In'
                              ? const Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28,
                                      color: Color.fromARGB(239, 255, 255, 255),
                                    ),
                                  ),
                                )
                              : ClipRect(
                                  child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(),
                                )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //activate sign up
                        setState(() {
                          _selectedAuthOption = 'Sign Up';
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 170,
                        color: const Color(0xff1766c3),
                        child: _selectedAuthOption == 'Sign Up'
                            ? const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28,
                                    color: Color.fromARGB(239, 255, 255, 255),
                                  ),
                                ),
                              )
                            : ClipRect(
                                child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(),
                              )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //Phone number textfield
                const Text('Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color.fromARGB(239, 255, 255, 255),
                    )),
                TextFieldWidget(
                  controller: emailController,
                ),
                const SizedBox(
                  height: 60,
                ),
                //Password textfield
                const Text('Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color.fromARGB(239, 255, 255, 255),
                    )),
                TextFieldWidget(
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 70),
                //sign Up buuton
                GetBuilder<AuthController>(
                  builder: (authController) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          registrationOrLogin(authController);
                        },
                        child: Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: _selectedAuthOption == 'Sign In'
                                  ? !authController.isLoading
                                      ? const Text(
                                          'Sign In',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff0141ac), fontSize: 26),
                                        )
                                      : const CircularProgressIndicator(color: Color(0xff0141ac))
                                  : !authController.isLoading
                                      ? const Text(
                                          'Sign Up',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff0141ac), fontSize: 26),
                                        )
                                      : const CircularProgressIndicator(color: Color(0xff0141ac)),
                            )),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Forgot your Password?',
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
