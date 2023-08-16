import 'package:flutter/material.dart';
import 'package:reservation_app/data/food_info_model.dart';
import 'package:reservation_app/pages/home/components/food_item_widget.dart';
import 'package:reservation_app/pages/home/components/header_section.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/app_distance.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: Dt.d_24),
            child: HeaderSection(
              title: 'Best Seller',
              onTapSeeAll: () {
                Navigator.pushNamed(context, RouteNamed.foodCategoryPage);
              },
            )),
        Padding(
          padding: EdgeInsets.only(left: Dt.d_24, top: Dt.d_8),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.1,
            child: ListView.separated(
              padding: EdgeInsets.only(right: Dt.d_24),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FoodItemWidget(
                  item: foodInfoListMockData[index],
                );
              },
              shrinkWrap: true,
              itemCount: foodInfoListMockData.length < 5
                  ? foodInfoListMockData.length
                  : 5,
            ),
          ),
        )
      ],
    );
  }
}
