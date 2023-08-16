import 'package:flutter/material.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/assets_management.dart';

class NotifySaveSuccessPage extends StatefulWidget {
  const NotifySaveSuccessPage({super.key});

  @override
  State<NotifySaveSuccessPage> createState() => _NotifySaveSuccessPageState();
}

class _NotifySaveSuccessPageState extends State<NotifySaveSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManagement.logoWithText),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                child: Image.asset(AssetsManagement.greenTick),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Your password has been changed',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.green)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 8, right: 8),
                child: Text(
                    textAlign: TextAlign.center,
                    'Please login again',
                    style: TextStyle(fontSize: 20, color: Color(0xFF9D170F))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15,
                    color: Colors.transparent,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF9D170F)),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, RouteNamed.loginPage);
                          // Navigator.pushNamed(context, PageName.loginPage);
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   RouteNamed.loginPage,
                          //   ModalRoute.withName(RouteNamed.loginPage),
                          // );
                          Navigator.pushReplacementNamed(context, RouteNamed.loginPage);
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        )),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
