import 'package:flutter/material.dart';
import 'package:reservation_app/data/food_info_model.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16),
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          return _buildFoodItem(context, foodInfoListMockData2[index]);
        },
        itemCount: foodInfoListMockData2.length,
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, FoodInfoModel item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
            child: Image.asset(item.imageAddress),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              ..._buildSauces(context, item.sauces),
              SizedBox(
                height: 4,
              ),
              Text(
                item.price ?? '',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _buildSauces(BuildContext context, List<SauceInfoModel>? list) {
    return list
            ?.map(
              (e) => Row(children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(e.color ?? 0xFF000000)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  e.name ?? '',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(e.color ?? 0xFF000000)),
                ),
              ]),
            )
            .toList() ??
        [];
  }
}
