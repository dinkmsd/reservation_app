import 'package:flutter/material.dart';
import 'package:reservation_app/data/discount_info_model.dart';
import 'package:reservation_app/routes/route_named.dart';

class HappyDealsItemWidget extends StatelessWidget {
  const HappyDealsItemWidget(
      {Key? key, required this.item, required this.index})
      : super(key: key);

  final DiscountInfoModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNamed.happyDealDetailPage);
      },
      child: Container(
          width: MediaQuery
              .sizeOf(context)
              .width / 1.5,
          decoration: BoxDecoration(
              gradient: index % 2 == 0 ? const LinearGradient(
                colors: [Colors.redAccent, Colors.orange],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ) : const LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(item.imageAddress),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Upto '.toUpperCase(),
                              style: const TextStyle(color: Colors.white)),
                          TextSpan(
                              text: item.discountNum,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.yellow)),
                          const TextSpan(
                            text: ' OFF',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'No upper limit',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
