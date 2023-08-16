import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo(
      {Key? key, required this.title, required this.imagePath, this.subtitle})
      : super(key: key);

  final String imagePath;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
        SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            subtitle != null
                ? SizedBox(
                    height: 4,
                  )
                : SizedBox.shrink(),
            subtitle != null
                ? Text(subtitle ?? '',
                    style: TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 12,
                        fontWeight: FontWeight.w500))
                : SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
