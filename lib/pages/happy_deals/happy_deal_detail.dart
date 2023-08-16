import 'package:flutter/material.dart';
import 'package:reservation_app/pages/happy_deals/components/drink_shaking.dart';
import 'package:reservation_app/pages/happy_deals/components/food_scaling.dart';
import 'package:reservation_app/pages/happy_deals/components/term_condition_box.dart';

class HappyDealDetailPage extends StatefulWidget {
  const HappyDealDetailPage({Key? key}) : super(key: key);

  @override
  State<HappyDealDetailPage> createState() => _HappyDealDetailPageState();
}

class _HappyDealDetailPageState extends State<HappyDealDetailPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  late final AnimationController _controller02 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-1.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  late final Animation<Offset> _offsetAnimation02 = Tween<Offset>(
    begin: const Offset(-1.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller02,
    curve: Curves.easeInOut,
  ));

  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: _controller02,
    curve: Curves.easeInOut,
  ));

  bool _isStart = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          _isStart = true;
        });
      },
    );
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        decoration: _isStart
            ? const BoxDecoration(
                gradient: LinearGradient(
                colors: [Color(0xFFFB6A70), Color(0xFFFCA384)],
              ))
            : const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFFCA384), Color(0xFFFB6A70)])),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 28,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Laaarge Discounts',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: _offsetAnimation,
                          child: const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Free',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '2 drinks',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Color(0xFFA93528),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              DrinkShaking()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SlideTransition(
                          position: _offsetAnimation02,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UP TO',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '20%',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                          color: Colors.white,
                                          blurRadius: 1.0,
                                          offset: Offset(0.5, 1.5))
                                    ],
                                    fontSize: 55,
                                    color: Color(0xFFA93528),
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'OFF',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: const Text(
                            'NO UPPER LIMIT!',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: FoodScaling(),
                  )
                ],
              ),
              const Expanded(
                child: TermConditionBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
