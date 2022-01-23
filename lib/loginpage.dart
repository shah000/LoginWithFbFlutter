import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_flogin/logincontroller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  notLoginScreen() {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Provider.of<loginController>(context, listen: false)
                    .SigninwithFb();
              },
              child: Text("Loginfb"))
        ],
      ),
    );
  }

  alreadyLoginScreen(loginController model) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(model.user!.photoURL ?? "").image,
            radius: 100,
          ),
          Row(
            children: [
              Text(model.user!.displayName ?? ""),
              Text(model.user!.email ?? ""),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    Provider.of<loginController>(context, listen: false)
                        .LogoutFb();
                  })
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginPageUi(),
    );
  }

  loginPageUi() {
    return Consumer<loginController>(
      builder: (context, model, child) {
        if (model.user != null) {
          return Center(child: alreadyLoginScreen(model));
        } else {
          return notLoginScreen();
        }
      },
    );
  }
}
