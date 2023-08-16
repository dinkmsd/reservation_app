import 'package:flutter/material.dart';
import 'package:reservation_app/data/notification_model.dart';
import 'package:reservation_app/utils/assets_management.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key,});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 32,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Mark as read',
                style: TextStyle(color: Color(0xFFAD3F32)),
              ),
            )
          ],
          backgroundColor: Colors.orange[50],
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: notificationListMockData.length,
                  itemBuilder: (context, index) =>
                      notificationItem(context, notificationListMockData[index]),
                ),
              )
            ],
          ),
        ));
  }

  Widget notificationItem(BuildContext context, NotificationModel item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          //widget 1
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(AssetsManagement.logo),
          ),

          //widget 2
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
              child: Column(
                children: [
                  //widget 2.1
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Reservation ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '#${item.reservationId}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                      const TextSpan(
                        text: ' has been deposited successfully.',
                        style: TextStyle(color: Colors.black),
                      )
                    ]),
                  ),

                  //widget 2.2
                  item.deposit != null
                      ? Row(
                    children: [
                      const Text(
                        'Total Deposit: ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '${item.deposit}VND',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),

                  //widget 2.3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.date,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Icon(Icons.chevron_right)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

