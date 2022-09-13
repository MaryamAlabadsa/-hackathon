import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OnboardingScreen.dart';
import 'login.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  initScreen=await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:initScreen==0 || initScreen==null?'onBoard':'home',
      routes: {
        'home':(context)=>SplashScreen(),
        'onBoard':(context)=>OnBoardingScreen()
      },
    );
  }
}



class SplashScreen extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
   initState()  {
    super.initState();
    Timer(
        Duration(seconds: 3),
         () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image(
            image: AssetImage(
              'assets/images/logo.png',
            )) // FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}

