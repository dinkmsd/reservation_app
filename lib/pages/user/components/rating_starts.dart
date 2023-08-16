import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  const StarRating({Key? key, required this.onStarChanged, this.initValue = 0}) : super(key: key);
  final ValueChanged<int> onStarChanged;
  final int initValue;

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _starRate = 0;

  @override
  void initState() {
    _starRate = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return starRow(context, _starRate);
  }

  Widget starRow(BuildContext context, int starNumber) {
    var listStar = <Widget>[];
    for (int i = 0; i < 5; i++) {
      listStar.add(GestureDetector(
        onTap: () {
          setState(() {
            _starRate = i + 1;
          });
          widget.onStarChanged.call(_starRate);
        },
        child: Icon(
          i < starNumber ? Icons.star_rounded : Icons.star_border_rounded,
          color: Colors.redAccent,
          size: MediaQuery.of(context).size.width / 7,
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...listStar],
    );
  }
}
