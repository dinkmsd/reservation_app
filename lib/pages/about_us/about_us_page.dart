import 'package:flutter/material.dart';
import 'package:reservation_app/data/about_us_model.dart';
import 'package:reservation_app/utils/assets_management.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[50],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(AssetsManagement.logoWithText),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      AssetsManagement.aboutUsBg,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          margin: const EdgeInsets.all(10),
                          child: DefaultTextStyle(
                            style: const TextStyle(fontSize: 14, height: 1.5),
                            textAlign: TextAlign.justify,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      'About us'.toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30,
                                          color: Colors.white,
                                          letterSpacing: -.3),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(aboutUsMockData.text1),
                                    const SizedBox(height: 10),
                                    Text(aboutUsMockData.text2),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(aboutUsMockData.text3),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(aboutUsMockData.text4),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(aboutUsMockData.text5)
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
