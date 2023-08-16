import 'package:flutter/material.dart';
import 'package:reservation_app/data/food_info_model.dart';

class FoodCateroryPage extends StatelessWidget {
  const FoodCateroryPage({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //widget 1.1
                      const Text(
                        'Best seller',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),

                      //widget 1.2
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: const [
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
                  itemCount: foodInfoListMockData.length,
                  itemBuilder: (context, index) =>
                      foodInfoItem(context, foodInfoListMockData[index]),
                ),
              )
            ],
          ),
        ));
  }

  Widget foodInfoItem(BuildContext context, FoodInfoModel item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //widget 1
          Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(item.imageAddress),
          ),

          //widget 2
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //widget 2.1
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),

                  //widget 2.2
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      item.description,
                      style: const TextStyle(),
                    ),
                  ),


                  //widget 2.3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //widget 2.3.1
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //widget 2.3.1.1
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: starRow(context, item.rate),
                          ),

                          //widget 2.3.1.2
                          Text('(${item.rateNumber})'),
                        ],
                      ),

                      //widget 2.3.2
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFAD3F32))),
                        child: const Text('Reserve'),
                      )
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

  Widget starRow(BuildContext context, int starNumber) {
    var listStar = <Widget>[];
    for (int i = 0; i < 5; i++) {
      listStar.add(const Icon(
        Icons.star_border_outlined,
        color: Colors.redAccent,
        size: 14,
      ));
    }
    for (int i = 0; i < starNumber; i++) {
      listStar[i] = const Icon(
        Icons.star,
        color: Colors.redAccent,
        size: 14,
      );
    }
    return Row(
      children: [...listStar],
    );
  }
}
