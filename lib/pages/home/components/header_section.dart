import 'package:flutter/material.dart';
import 'package:reservation_app/utils/app_color.dart';
import 'package:reservation_app/utils/app_distance.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key, required this.title, required this.onTapSeeAll}) : super(key: key);

  final String title;
  final VoidCallback onTapSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.brow_1),
        ),
        InkWell(
          onTap: () => onTapSeeAll.call(),
          child: Row(
            children: [
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.grey_99),
              ),
              SizedBox(width: Dt.d_8,),
              Icon(Icons.arrow_forward_ios_outlined, size: 12,
                color: AppColor.grey_99,)
            ],
          ),
        ),
      ],
    );
  }
}
