import 'package:flutter/material.dart';

class CarouselBodyWidget extends StatelessWidget {
  const CarouselBodyWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imagePath})
      : super(key: key);

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: Image.asset(imagePath)),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF483232)),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF483232)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
