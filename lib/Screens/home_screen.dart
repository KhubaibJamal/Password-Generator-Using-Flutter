import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password_generator/Screens/password_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PasswordScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191a1c),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/lock.PNG'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .067,
          ),
          const CircularProgressIndicator(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
