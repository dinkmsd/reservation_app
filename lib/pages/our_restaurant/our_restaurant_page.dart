import 'package:flutter/material.dart';
import 'package:reservation_app/data/restaurant_model.dart';
import 'package:reservation_app/routes/route_named.dart';

class OurRestaurantPage extends StatelessWidget {
  const OurRestaurantPage({Key? key}) : super(key: key);

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
              Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //widget 1.1
                      const Text(
                        'Our restaurant',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),

                      //widget 1.2
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Row(
                          children: [
                            //widget 1.2.1
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'ALL',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            //widget 1.2.2
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(Icons.keyboard_arrow_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),

              //widget 2
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: restaurantListMockData.length,
                  itemBuilder: (context, index) =>
                      foodLocationItem(context, restaurantListMockData[index]),
                ),
              )
            ],
          ),
        ));
  }

  Widget foodLocationItem(BuildContext context, RestaurantModel item) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteNamed.restaurantPage),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //widget 1
          Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Image.asset(
              item.imageAddress,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),

          //widget 2
          Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    //widget 2.1
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //widget 2.3.1.1
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              item.name,
                            ),
                          ),

                          //widget 2.3.1.2
                          Text(
                            item.address,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    //widget 2.2
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFAD3F32))),
                      child: const Text('Reserve'),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
