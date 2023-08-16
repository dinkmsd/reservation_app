import 'package:flutter/material.dart';
import 'package:reservation_app/data/discount_info_model.dart';
import 'package:reservation_app/routes/route_named.dart';

class HappyDealsPage extends StatelessWidget {
  const HappyDealsPage({Key? key}) : super(key: key);

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
                  'Happy Deals',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),

              //widget 2
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: discountListMockData.length,
                  itemBuilder: (context, index) =>
                      discountInfoItem(context, discountListMockData[index], index),
                ),
              )
            ],
          ),
        ));
  }

  Widget discountInfoItem(BuildContext context, DiscountInfoModel item, index) {
    if(index % 2 ==0){
      return InkWell(
        onTap: (){
          Navigator.pushNamed(context, RouteNamed.happyDealDetailPage);
        },
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.redAccent, Colors.orange],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ), borderRadius: BorderRadius.circular(12)),
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
                        child: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white,),
                      )
                    ],
                  ),
                ),

              ],
            )),
      );
    }else{
      return InkWell(
        onTap: (){
          Navigator.pushNamed(context, RouteNamed.happyDealDetailPage);
        },
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.greenAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ), borderRadius: BorderRadius.circular(12)),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(item.imageAddress),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white,),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 32,
                          child: Text(
                            item.discountNum,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )),
      );
    }

  }
}
