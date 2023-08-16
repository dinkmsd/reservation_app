import 'package:flutter/material.dart';
import 'package:reservation_app/pages/restaurant/tabs/menu_tab.dart';
import 'package:reservation_app/pages/restaurant/tabs/reservation_tab.dart';
import 'package:reservation_app/pages/restaurant/tabs/reviews_tab.dart';
import 'package:reservation_app/utils/assets_management.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EFE8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Image.asset(
                  AssetsManagement.itemExample01,
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).width / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "An BBQ Dong Khoi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'now Open ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
                                            TextSpan(
                                                text: ' - Closes at 10:00PM!',
                                                style: TextStyle(fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 55,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.red.shade900,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),

            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[50]),
              tabs: [
                TabTitle.tabBarButton(
                    title: 'Reservation', index: 0, curIndex: 0),
                TabTitle.tabBarButton(title: 'Menu', index: 0, curIndex: 1),
                TabTitle.tabBarButton(title: 'Reviews', index: 0, curIndex: 2),
              ],
              onTap: (value) {
                setState(() {
                  // _tabController.index = value;
                });
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ReservationTab(),
                  MenuTab(),
                  ReviewsTab()
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class TabTitle {
  static Widget tabBarButton(
      {required String title, required int index, required curIndex}) {
    return Tab(
      child: Container(
        child: Text(
          '$title',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: index == curIndex ? Colors.red[900] : Colors.black),
        ),
      ),
    );
  }
}
