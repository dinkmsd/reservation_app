import 'package:flutter/material.dart';
import 'package:reservation_app/components/primary_button.dart';
import 'package:reservation_app/pages/comfirm_reservation/bottom_sheet_confirm.dart';
import 'package:reservation_app/pages/comfirm_reservation/components/note_section.dart';
import 'package:reservation_app/pages/comfirm_reservation/components/payments_section.dart';
import 'package:reservation_app/pages/comfirm_reservation/components/reservation_info_section.dart';
import 'package:reservation_app/pages/comfirm_reservation/components/user_info_section.dart';

class BottomSheetConfirmReservation extends StatelessWidget {
  const BottomSheetConfirmReservation({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Your Reservation',
                        style: TextStyle(
                            color: Color(0xFF0A191E),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                const ReservationInfoSection(),
                const SizedBox(
                  height: 10,
                ),
                const UserInfoSection(),
                const SizedBox(
                  height: 10,
                ),
                const NoteSection(),
                const SizedBox(
                  height: 10,
                ),
                const PaymentsSection(),
                const SizedBox(
                  height: 18,
                ),
                PrimaryButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      builder: (context) => BottomSheetConfirm(),
                    );
                    Navigator.pop(context);
                  },
                  title: 'CONFIRM',
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
