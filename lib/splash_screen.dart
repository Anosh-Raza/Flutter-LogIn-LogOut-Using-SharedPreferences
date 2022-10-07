import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    if (islogin) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2020/07/03/16/51/mountains-5367026_960_720.jpg')),
    );
  }
}
