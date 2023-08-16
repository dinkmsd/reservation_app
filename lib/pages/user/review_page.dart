import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reservation_app/data/reservation_model.dart';
import 'package:reservation_app/data/review_model.dart';
import 'package:reservation_app/pages/user/components/rating_starts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, this.reservation});

  final ReservationModel? reservation;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _textController = TextEditingController();

  Future<ReviewModel> _loadDataFromLocalStorage() async {
    var shareF = await SharedPreferences.getInstance();
    var ratingFromStorage =
        shareF.getString(widget.reservation?.reservationId ?? '');
    if (ratingFromStorage == null) return Future.value(ReviewModel());
    var rating = ReviewModel.fromJson(jsonDecode(ratingFromStorage));
    return Future.value(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Review Restaurant',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 32,
            ),
          ),
          backgroundColor: Colors.orange[50],
          elevation: 0.0,
        ),
        body: FutureBuilder(
          future: _loadDataFromLocalStorage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              var rating = snapshot.data ?? ReviewModel();
              _textController.text = rating.comment ?? '';
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //widget 1
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          '#${widget.reservation?.reservationId}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          widget.reservation?.imageAddress ?? '',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.reservation?.address ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      StarRating(
                        onStarChanged: (value) {
                          rating.rating = value;
                        },
                        initValue: rating.rating ?? 0,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Your comment',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextField(
                        controller: _textController,
                        maxLines: 4, //or null
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true),
                        autofocus: false,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.camera_alt),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Photo',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            rating.comment = _textController.text;

                            //save data to local storage
                            var shareF = await SharedPreferences.getInstance();
                            await shareF.setString(
                                widget.reservation?.reservationId ?? '',
                                jsonEncode(rating.toJson()));

                            //notify the succession
                            if (mounted) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text('Your review has sent successful!'),
                              ));
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFAD3F32)),
                              elevation: MaterialStateProperty.all(0.0),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                          child: const Text(
                            'SEND',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
