import 'package:flutter/material.dart';
import 'package:reservation_app/utils/assets_management.dart';

class DrinkShaking extends StatefulWidget {
  const DrinkShaking({Key? key}) : super(key: key);

  @override
  State<DrinkShaking> createState() => _DrinkShakingState();
}

class _DrinkShakingState extends State<DrinkShaking>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  )..repeat(reverse: true);

  late final Animation<double> _animation =
  Tween<double>(begin: -0.01, end: 0.04).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _animation,
        child: Image.asset(AssetsManagement.cocaCola));
  }
}
