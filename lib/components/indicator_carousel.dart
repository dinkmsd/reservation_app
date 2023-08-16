import 'package:flutter/material.dart';

class IndicatorCarousel extends StatelessWidget {
  const IndicatorCarousel(
      {Key? key, required this.curPageIndex, required this.length})
      : super(key: key);

  final int curPageIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    List<Widget> dotList = List.generate(
      length,
      (index) => buildDot(context, curPageIndex == index),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dotList,
    );
  }

  Widget buildDot(BuildContext context, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFAD3F32) : Colors.grey,
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
