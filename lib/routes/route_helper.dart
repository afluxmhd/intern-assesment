import 'package:get/get_navigation/get_navigation.dart';
import 'package:intern_assesment/screens/home_page.dart';
import 'package:intern_assesment/screens/sign_up_page.dart';
import 'package:intern_assesment/screens/splash_page.dart';
import 'package:intern_assesment/screens/transaction_screen.dart';

class RouterHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String transactionPage = "/transaction-page";
  static const String signUpAndSignIn = "/sign-up-and-sign-in";

  static String getSplash() => splashPage;
  static String getInitial() => initial;
  static String gettransactionPage() => transactionPage;
  static String getSignInAndSignUpPage() => signUpAndSignIn;

  static List<GetPage> routes = [
    GetPage(
        name: splashPage,
        page: () {
          return const SplashPage();
        }),
    GetPage(
        name: signUpAndSignIn,
        page: () {
          return const SignUpPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: initial,
        page: () {
          return const HomePage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: transactionPage,
        page: () {
          return const TransactionPage();
        }),
  ];
}
