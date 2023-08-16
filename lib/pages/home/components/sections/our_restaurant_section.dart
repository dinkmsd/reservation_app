import 'package:flutter/material.dart';
import 'package:reservation_app/data/restaurant_model.dart';
import 'package:reservation_app/pages/home/components/header_section.dart';
import 'package:reservation_app/pages/home/components/restaurant_item_widget.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/app_distance.dart';

class OurRestaurantSection extends StatelessWidget {
  const OurRestaurantSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dt.d_24),
          child: HeaderSection(
            title: 'Our restaurant',
            onTapSeeAll: () {
              Navigator.pushNamed(context, RouteNamed.restaurantListPage);

            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dt.d_24, vertical: Dt.d_10),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => SizedBox(height: Dt.d_10,),
            itemBuilder: (context, index) {
              return RestaurantItemWidget(item: restaurantListMockData[index],);
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: restaurantListMockData.length < 3
                ? restaurantListMockData.length
                : 3,
          ),
        )
      ],
    );
  }
}
