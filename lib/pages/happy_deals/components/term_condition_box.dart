import 'package:flutter/material.dart';
import 'package:reservation_app/utils/assets_management.dart';

class TermConditionBox extends StatefulWidget {
  const TermConditionBox({Key? key}) : super(key: key);

  @override
  State<TermConditionBox> createState() => _TermConditionBoxState();
}

class _TermConditionBoxState extends State<TermConditionBox>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final AnimationController _controllerButton = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end:  Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  late final Animation<Offset> _offsetSub01 = Tween<Offset>(
    begin: const Offset(-1.5, 0.0),
    end:  Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  late final Animation<Offset> _offsetSub02 = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end:  Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  late final Animation<Offset> _offsetButton = Tween<Offset>(
    begin: const Offset(0.0, 2.5),
    end:  Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controllerButton,
    curve: Curves.easeInOut,
  ));

  @override
  void initState() {
    _controller.addListener(_controllerListen);
    super.initState();
  }

  void _controllerListen(){
    if(_controller.isCompleted){
      _controllerButton.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Terms & Condition',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 18,
              ),
              SlideTransition(
                position: _offsetSub01,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20% off for family reservation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Time slots from 10:00 to 15:00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(AssetsManagement.intro01)
                  ],
                ),
              ),
              SlideTransition(
                position: _offsetSub02,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManagement.intro02),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20% off for family reservation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Time slots from 10:00 to 15:00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              SlideTransition(
                position: _offsetButton,
                child: FilledButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFAD3F32)),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700))),
                  onPressed: () {},
                  child: const Text('GET IT NOW'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
