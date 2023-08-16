import 'package:flutter/material.dart';
import 'package:reservation_app/data/restaurant_model.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/assets_management.dart';

class RestaurantItemWidget extends StatelessWidget {
  const RestaurantItemWidget({Key? key, required this.item}) : super(key: key);

  final RestaurantModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteNamed.restaurantPage),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //widget 1
          Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Image.asset(
              item.imageAddress,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),

          //widget 2
          Container(
              margin: const EdgeInsets.only( left: 12, right: 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    //widget 2.1
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //widget 2.3.1.1
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              item.name,
                            ),
                          ),

                          //widget 2.3.1.2
                          Text(
                            item.address,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    //widget 2.2
                    Image.asset(AssetsManagement.miniLogo)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
