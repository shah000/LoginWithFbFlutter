import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_flogin/usermodel.dart';

class loginController extends ChangeNotifier {
  User? user;
  // ignore: non_constant_identifier_names
  SigninwithFb() async {
    var result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
    if (result.status == LoginStatus.success) {
      final reqData = await FacebookAuth.i
          .getUserData(fields: "email, name, picture.type(large)");
      this.user = new User(
          displayName: reqData['name'],
          email: reqData['email'],
          photoURL: reqData['picture']['data']['url'] ?? "");
      notifyListeners();
    }
  }

  LogoutFb() async {
    await FacebookAuth.i.logOut();
    user = null;
    notifyListeners();
  }
}
