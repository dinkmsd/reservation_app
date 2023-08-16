import 'package:flutter/material.dart';
import 'package:reservation_app/components/indicator_carousel.dart';
import 'package:reservation_app/utils/assets_management.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({Key? key}) : super(key: key);

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _banners = [
    Image.asset(
      AssetsManagement.bannerPath,
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      AssetsManagement.bannerPath,
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      AssetsManagement.bannerPath,
      fit: BoxFit.fitWidth,
    )
  ];

  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: PageView(
              children: _banners,
              onPageChanged: (value) {
                setState(() {
                  _curIndex = value;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IndicatorCarousel(
            curPageIndex: _curIndex,
            length: _banners.length,
          ),
        )
      ],
    );
  }
}
