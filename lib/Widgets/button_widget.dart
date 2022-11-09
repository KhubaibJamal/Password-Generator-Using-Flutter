import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  IconData btnIcon;
  VoidCallback onPress;
  ButtonWidget({required this.btnIcon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2.20,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Icon(
            btnIcon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
