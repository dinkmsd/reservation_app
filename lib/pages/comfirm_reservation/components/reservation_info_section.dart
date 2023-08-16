import 'package:flutter/material.dart';
import 'package:reservation_app/pages/comfirm_reservation/components/row_info.dart';
import 'package:reservation_app/utils/assets_management.dart';

class ReservationInfoSection extends StatelessWidget {
  const ReservationInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6EFE8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowInfo(
              imagePath: AssetsManagement.locationIcon,
              title: 'Ann BBQ Su Van Hanh',
              subtitle: 'No. 716 Su Van Hanh, Ward 12, Dist 10, HCM',
            ),
            SizedBox(
              height: 12,
            ),
            RowInfo(
              imagePath: AssetsManagement.calendarIcon,
              title: 'Wednesday, 25th Sep 2021',
            ),
            SizedBox(
              height: 12,
            ),
            RowInfo(
              imagePath: AssetsManagement.timeIcon,
              title: '18h00 - 18h30',
            ),
            SizedBox(
              height: 12,
            ),
            RowInfo(
              imagePath: AssetsManagement.userIcon,
              title: '2 People',
            ),
          ],
        ),
      ),
    );
  }
}
