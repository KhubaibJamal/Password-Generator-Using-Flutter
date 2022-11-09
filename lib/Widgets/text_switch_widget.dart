import 'package:flutter/material.dart';

class ReusableRowWidget extends StatefulWidget {
  String text;
  bool switchValue;

  ReusableRowWidget({required this.text, required this.switchValue});

  @override
  State<ReusableRowWidget> createState() => _ReusableRowWidgetState();
}

class _ReusableRowWidgetState extends State<ReusableRowWidget> {
  // bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
        SizedBox(
          height: 50,
          width: 70,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: widget.switchValue,
              onChanged: (value) {
                setState(() {
                  widget.switchValue = !widget.switchValue;
                });
              },
              activeTrackColor: const Color(0xff2C3639),
              activeColor: const Color(0xffDCD7C9),
              inactiveThumbColor: const Color.fromARGB(255, 180, 171, 144),
              inactiveTrackColor: const Color(0xff7F8487),
            ),
          ),
        ),
      ],
    );
  }
}
