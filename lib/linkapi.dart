class AppLink {
  static const String server = "https://mft-ltd.com/ecommerce_amjad/delivery";

  // +++++++++++++++++++++++ Image++++++++++++++++++++++++
  static const String imageStatic =
      "https://mft-ltd.com/ecommerce_amjad/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageitems = "$imageStatic/items";
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++

  //
  static const String test = "$server/test.php";

  // +++++++++++++++++++++++ Notification ++++++++++++++++++++++++
  static const String notification = "$server/notification.php";



  // +++++++++++++++++++++++ Home ++++++++++++++++++++++++
  static const String homepage = "$server/home.php";

  // +++++++++++++++++++++++ Items ++++++++++++++++++++++++
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";


  // +++++++++++++++++++++++ Orders ++++++++++++++++++++++
  static const String viewPendingOrders = "$server/orders/pending.php";
  static const String viewAcceptedOrders = "$server/orders/accepted.php";
  static const String viewArchiveOrders = "$server/orders/archive.php";
  static const String detailsOrders = "$server/orders/details.php";
  static const String approveOrders = "$server/orders/approve.php";
  static const String doneOrders = "$server/orders/done.php";


  // +++++++++++++++++++++++ Auth Delivery++++++++++++++++++++++++
  static const String signUpDelivery = "$server/auth/signup.php";
  static const String loginDelivery = "$server/auth/login.php";
  static const String verifyCodeSignUpDelivery =
      "$server/auth/verifycode.php";
  static const String reSendDelivery = "$server/auth/resend.php";

  // +++++++++++++++++++++++ ForgetPassword ++++++++++++++++++++++++

  static const String checkEmailDelivery =
      "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPasswordDelivery =
      "$server/forgetpassword/verifycode.php";
  static const String resetPasswordDelivery =
      "$server/forgetpassword/resetpassword.php";
}
