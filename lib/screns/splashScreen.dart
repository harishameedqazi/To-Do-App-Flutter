import 'package:flutter/material.dart';
import 'package:todoapp/screns/todo_app.dart';

class SplashS extends StatefulWidget {
  const SplashS({super.key});

  @override
  State<SplashS> createState() => _SplashSState();
}

class _SplashSState extends State<SplashS> {
  navigation() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TODOApp()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 260,
                width: 260,
                child: Image(
                    image:
                        AssetImage("assets/images/icon-removebg-preview.jpg")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
