import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_assesment/controllers/auth_controller.dart';
import 'package:intern_assesment/routes/route_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loading() {
    bool isUserloggedIn = Get.find<AuthController>().isUserLoggedIn();
    if (isUserloggedIn) {
      Get.toNamed(RouterHelper.getInitial());
    } else {
      Get.toNamed(RouterHelper.getSignInAndSignUpPage());
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      loading();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Color(0xff0141ac),
            ),
            SizedBox(height: 20),
            Text(
              'Intern Assesment loading...',
              style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
