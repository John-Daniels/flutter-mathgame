import 'package:flutter/material.dart';

class MyAnsButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const MyAnsButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
