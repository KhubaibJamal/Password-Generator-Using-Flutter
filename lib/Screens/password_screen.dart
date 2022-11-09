import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/Widgets/button_widget.dart';
import 'dart:math';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String showPassword = "Password";

  bool isNumber = true;
  bool isSymbol = true;
  bool isLowercase = true;
  bool isUppercase = true;

  String generatedPassword({
    bool hasNumber = true,
    bool hasSymbol = true,
    bool hasLowercase = true,
    bool hasUppercase = true,
  }) {
    hasNumber = isNumber;
    hasSymbol = isSymbol;
    hasLowercase = isLowercase;
    hasUppercase = isUppercase;
    print('Number: $isNumber');

    const passwordLength = 20;
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const number = '0123456789';
    const specialChar = "!@{}[]#\$%_-&*(),.";

    String char = "";
    if (hasNumber) {
      char += number;
    }
    if (hasSymbol) {
      char += specialChar;
    }
    if (hasLowercase) {
      char += lowercase;
    }
    if (hasUppercase) {
      char += uppercase;
    }
    if (hasNumber == false &&
        hasSymbol == false &&
        hasLowercase == false &&
        hasUppercase == false) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "Error",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                "All button are closed\nKindly open switch button",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            );
          });
    }

    return List.generate(passwordLength, (index) {
      final indexRandom = Random.secure().nextInt(char.length);

      return char[indexRandom];
    }).join('');
  }

  void buttonMethod() {
    final password = generatedPassword();
    showPassword = password;
    setState(() {});
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .06),
              Card(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: Colors.orange,
                    color: const Color(0xff3F4E4F),

                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      showPassword,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .030),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(
                    btnIcon: Icons.content_copy,
                    onPress: () async {
                      await Clipboard.setData(
                          ClipboardData(text: showPassword));
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Password Copied!",
                              style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                    },
                  ),
                  ButtonWidget(
                    btnIcon: Icons.change_circle,
                    onPress: () {
                      buttonMethod();
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .066),
              Container(
                padding: const EdgeInsets.all(15.0),
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xff3F4E4F),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    // ReusableRowWidget(text: "Number", switchValue: isNumber),
                    // ReusableRowWidget(text: "Symbols", switchValue: isSymbol),
                    // ReusableRowWidget(
                    //     text: "Lowercase", switchValue: isLowercase),
                    // ReusableRowWidget(
                    //     text: "UpperCase", switchValue: isUppercase),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Number",
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              value: isNumber,
                              onChanged: (value) {
                                setState(() {
                                  isNumber = !isNumber;
                                });
                              },
                              activeTrackColor: const Color(0xff2C3639),
                              activeColor: const Color(0xffDCD7C9),
                              inactiveThumbColor: const Color(0xffDCD7C9),
                              inactiveTrackColor: const Color(0xff7F8487),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Symbols",
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              value: isSymbol,
                              onChanged: (value) {
                                setState(() {
                                  isSymbol = !isSymbol;
                                });
                              },
                              activeTrackColor: const Color(0xff2C3639),
                              activeColor: const Color(0xffDCD7C9),
                              inactiveThumbColor: const Color(0xffDCD7C9),
                              inactiveTrackColor: const Color(0xff7F8487),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Lowercase",
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              value: isLowercase,
                              onChanged: (value) {
                                setState(() {
                                  isLowercase = !isLowercase;
                                });
                              },
                              activeTrackColor: const Color(0xff2C3639),
                              activeColor: const Color(0xffDCD7C9),
                              inactiveThumbColor: const Color(0xffDCD7C9),
                              inactiveTrackColor: const Color(0xff7F8487),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Uppercase",
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              value: isUppercase,
                              onChanged: (value) {
                                setState(() {
                                  isUppercase = !isUppercase;
                                });
                              },
                              activeTrackColor: const Color(0xff2C3639),
                              activeColor: const Color(0xffDCD7C9),
                              inactiveThumbColor: const Color(0xffDCD7C9),
                              inactiveTrackColor: const Color(0xff7F8487),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .060),
              GestureDetector(
                onTap: () {
                  buttonMethod();
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Generate",
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
