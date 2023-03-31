import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intern_assesment/controllers/auth_controller.dart';
import 'package:intern_assesment/routes/route_helper.dart';
import 'package:intern_assesment/screens/main_page.dart';
import 'package:intern_assesment/screens/transaction_screen.dart';
import 'package:intern_assesment/widgets/custom_snack_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    MainPage(),
    const TransactionPage(),
    const Center(
      child: Text('Screen 3'),
    ),
    const Center(
      child: Text('Screen 4'),
    ),
    Center(
      child: ElevatedButton(
        onPressed: () {
          Get.find<AuthController>().clearSharedData();
          showCustomSnackBar('Sign Out Successfully', title: 'Sign Out');
          Get.toNamed(RouterHelper.getSignInAndSignUpPage());
        },
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff0141ac)),
        child: const Text('Sign Out!'),
      ),
    ),
  ];
  int _selectedIndex = 0;

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff0141ac),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 36),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined, size: 36),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security, size: 36),
            label: "Security",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 36),
            label: "Me",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 36),
            label: "Settings",
          )
        ],
      ),
    ));
  }
}
