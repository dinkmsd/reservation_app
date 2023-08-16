import 'package:flutter/material.dart';
import 'package:reservation_app/components/indicator_carousel.dart';
import 'package:reservation_app/pages/onboarding/components/carousel_body_widget.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/services/local_storage/app_shared_preference.dart';
import 'package:reservation_app/utils/app_color.dart';
import 'package:reservation_app/utils/app_distance.dart';
import 'package:reservation_app/utils/assets_management.dart';
import 'package:reservation_app/utils/storage_key_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var _curPageIndex = 0;
  final _pageViewController = PageController();

  final _carousels = <CarouselBodyWidget>[
    const CarouselBodyWidget(
      imagePath: 'assets/images/illustrations/tracking_maps.png',
      title: 'Nearby restaurants',
      description: 'Don\'t have to go far to find a good restaurant',
    ),
    const CarouselBodyWidget(
      imagePath: 'assets/images/illustrations/order_illustration.png',
      title: 'Convenient',
      description: 'Online dish reservation',
    ),
    const CarouselBodyWidget(
      imagePath: 'assets/images/illustrations/safe_food.png',
      title: 'Delicious',
      description: 'Enjoy great food with your family',
    ),
  ];

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void _onNavigateToHome(BuildContext context) async {
    AppSharedPreference.writeOnBoardingData();
    if (mounted) {
      Navigator.pushReplacementNamed(context, RouteNamed.homePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Image.asset(AssetsManagement.logoWithText),
            ),
            Expanded(
              child: PageView(
                controller: _pageViewController,
                onPageChanged: (value) {
                  setState(() {
                    _curPageIndex = value;
                  });
                },
                children: _carousels,
              ),
            ),
            Padding(
              padding:
                   EdgeInsets.only(left: Dt.d_26, right: Dt.d_26, bottom: Dt.d_24),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _onNavigateToHome(context);
                        },
                        child:  Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: Dt.d_16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey_2),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_curPageIndex == _carousels.length - 1) {
                            _onNavigateToHome(context);
                          } else {
                            _pageViewController.animateToPage(_curPageIndex + 1,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 300));
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColor.grey_99,
                        ),
                      )
                    ],
                  ),
                  IndicatorCarousel(
                    curPageIndex: _curPageIndex,
                    length: _carousels.length,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
