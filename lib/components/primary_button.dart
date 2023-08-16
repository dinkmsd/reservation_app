import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed.call(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(25))),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF9D170F)),
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
