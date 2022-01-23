import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_keyhash/flutter_facebook_keyhash.dart';

import 'package:social_flogin/logincontroller.dart';
import 'package:social_flogin/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => loginController(),
          child: LoginPage(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook ',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(child: LoginPage()),
          )),
    );
  }
}
