import 'package:flutter/material.dart';
import 'package:reservation_app/utils/assets_management.dart';

class PaymentsSection extends StatelessWidget {
  const PaymentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6EFE8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: Row(
          children: [
            Image.asset(
              AssetsManagement.cashIcon,
              width: 24,
              height: 24,
            ),
            SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your deposit is 200.000VND',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Please pay ',
                        style: TextStyle(
                          color: Color(0xFFAD3F32),
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'within 30 minutes.',
                            style: TextStyle(
                                color: Color(0xFFAD3F32),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                              text:
                                  ' If not, your reservation will be canceled automatically.',
                              style: TextStyle(
                                color: Color(0xFFAD3F32),
                                fontSize: 12,
                              ))
                        ]),
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
