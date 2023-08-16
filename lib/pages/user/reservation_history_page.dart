import 'package:flutter/material.dart';
import 'package:reservation_app/data/reservation_model.dart';
import 'package:reservation_app/data/reservation_state.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/datetime_utils.dart';

class ReservationHistoryPage extends StatefulWidget {
  const ReservationHistoryPage({super.key});

  @override
  State<ReservationHistoryPage> createState() => _ReservationHistoryPageState();
}

class _ReservationHistoryPageState extends State<ReservationHistoryPage> {
  void _onItemSelected(BuildContext context, ReservationModel? reservation) {
    if (reservation?.state == ReservationState.finished) {
      Navigator.pushNamed(context, RouteNamed.reviewPage,
          arguments: reservation);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        content:
        Text('You must finish the reservation before reviewing'),
      ));
    }
  }

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
          backgroundColor: Colors.orange[50],
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //widget 1
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Your reservation',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),

              //widget 2
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: reservationMockDataList.length,
                  itemBuilder: (context, index) => _buildReservationItem(
                      context, reservationMockDataList[index]),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildReservationItem(BuildContext context, ReservationModel item) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => _onItemSelected(context, item),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              item.imageAddress ?? '',
                              width: MediaQuery.sizeOf(context).width / 7,
                              height: MediaQuery.sizeOf(context).width / 7,
                            ),

                            const SizedBox(
                              width: 16,
                            ),
                            //widget 2
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 8, right: 16),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    //widget 2.1
                                    Text(
                                      DateTimeUtils.getDayOfMonthFromString(
                                          source: item.date ?? '',
                                          format: DateTimeUtils.dmySlashFormat),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),

                                    Text(
                                      '${DateTimeUtils.getMonthNameFromString(source: item.date ?? '', format: DateTimeUtils.dmySlashFormat)}, ${DateTimeUtils.getDayNameOfWeekFromString(source: item.date ?? '', format: DateTimeUtils.dmySlashFormat)}',
                                      style: const TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '#${item.reservationId}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.address}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              '${item.personNumber ?? 0} people, ${item.timeSlot}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xFFAD3F32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2),
                          child: Text(
                            '${item.state?.convertToString()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Positioned.fill(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.chevron_right)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
