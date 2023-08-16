import 'package:flutter/material.dart';
import 'package:reservation_app/data/review_model.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16),
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          return _buildItem(context, reviewModelMockData[index]);
        },
        itemCount: reviewModelMockData.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, ReviewModel item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  item.avatar ?? '',
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@${item.userName}',
                      style: TextStyle(fontSize: 12, color: Color(0xFF483232)),
                    ),
                    Text(
                      item.reviewDate ?? '',
                      style: TextStyle(fontSize: 11, color: Color(0xFF979797)),
                    )
                  ],
                ),
                Spacer(),
                starRow(context, item.rating ?? 0)
              ],
            ),
            SizedBox(height: 4,),
            Text(
              '${item.comment}',
              style: TextStyle(fontSize: 13, color: Color(0xFF483232)),
            ),
          ],
        ),
      ),
    );
  }

  Widget starRow(BuildContext context, int starNumber) {
    var listStar = <Widget>[];
    for (int i = 0; i < 5; i++) {
      listStar.add(Icon(
        Icons.star_rounded,
        color: i < starNumber ? Color(0xFFA93528) : Color(0xFFC9C3BD),
        size: MediaQuery.of(context).size.width / 15,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...listStar],
    );
  }
}
