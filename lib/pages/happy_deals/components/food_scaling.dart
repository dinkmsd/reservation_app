import 'package:flutter/material.dart';
import 'package:reservation_app/utils/assets_management.dart';

class FoodScaling extends StatefulWidget {
  const FoodScaling({Key? key}) : super(key: key);

  @override
  State<FoodScaling> createState() => _FoodScalingState();
}

class _FoodScalingState extends State<FoodScaling>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation =
  Tween<double>(begin: 0.8, end: 1).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(
        AssetsManagement.itemExample05,
        width: 259,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
