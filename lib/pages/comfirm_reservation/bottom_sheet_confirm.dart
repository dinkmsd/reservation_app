import 'package:flutter/material.dart';
import 'package:reservation_app/components/primary_button.dart';
import 'package:reservation_app/utils/assets_management.dart';

class BottomSheetConfirm extends StatelessWidget {
  const BottomSheetConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                Image.asset(
                  AssetsManagement.greenTick,
                  height: 85,
                  width: 85,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    'Your reservation is confirmed!',
                    style: TextStyle(
                      color: Color(0xFF6AC259),
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    'Your deposit for Reservation 716001 is 200.000VND. \nDo you want to pay now?',
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 12,
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'PAYMENT',
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                    'Note: If the customer cancels the reservation due to subjective reasons, the restaurant will not be responsible for refunding the deposit.',
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 12,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
