import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/middleware/mymiddleware.dart';
// import 'package:delivery/view/screen/address/add.dart';
// import 'package:delivery/view/screen/address/adddetails.dart';
// import 'package:delivery/view/screen/address/view.dart';
import 'package:granddelivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:granddelivery/view/screen/auth/login.dart';
import 'package:granddelivery/view/screen/auth/forgetpassword/resetpassword.dart';
// import 'package:delivery/view/screen/auth/signup.dart';
import 'package:granddelivery/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:granddelivery/view/screen/auth/success_signup.dart';
import 'package:granddelivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:granddelivery/view/screen/auth/verifycodesignup.dart';
// import 'package:delivery/view/screen/cart.dart';
// import 'package:delivery/view/screen/checkout.dart';
import 'package:granddelivery/view/screen/homescreen.dart';
// import 'package:delivery/view/screen/items.dart';
import 'package:granddelivery/view/screen/language.dart';
// import 'package:delivery/view/screen/myfavorite.dart';
// import 'package:delivery/view/screen/offers.dart';
// import 'package:delivery/view/screen/onboarding.dart';
import 'package:granddelivery/view/screen/orders/archive.dart';
import 'package:granddelivery/view/screen/orders/details.dart';
import 'package:granddelivery/view/screen/orders/pending.dart';
// import 'package:delivery/view/screen/productdetails.dart';
import 'package:get/get.dart';
import 'package:granddelivery/view/screen/orders/tracking.dart';

List<GetPage<dynamic>>? routes = [
  // {/ this is root app }
  // language
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.seccessResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUP()),


  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),


  //Orders
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.tracking, page: () => const OrdersTracking()),

];
