import 'package:flutter/material.dart';
import 'package:reservation_app/components/primary_button.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/assets_management.dart';
import 'package:reservation_app/utils/regex_management.dart';

class ForgotPasswordGetOtpPage extends StatefulWidget {
  const ForgotPasswordGetOtpPage({super.key});

  @override
  State<ForgotPasswordGetOtpPage> createState() =>
      _ForgotPasswordGetOtpPageState();
}

class _ForgotPasswordGetOtpPageState extends State<ForgotPasswordGetOtpPage> {
  final keyOfGetOTP = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keyOfGetOTP,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManagement.logoWithText),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManagement.timelineStep1),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 8, right: 8),
                child: Text('FORGOT PASSWORD',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 8, right: 8),
                child: Text(
                    textAlign: TextAlign.center,
                    'We will send you an OTP on your phone number',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        hintText: 'Enter your phone number',
                        hintStyle:
                            TextStyle(fontSize: 20, color: Colors.black54),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'phone number can not be empty';
                      }
                      if (!RegexManagement.email.hasMatch(value)) {
                        return 'Your phone number is invalid';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15,
                    color: Colors.transparent,
                    child: PrimaryButton(
                      title: 'GET OTP',
                      onPressed: () {
                        //validate
                        Navigator.pushNamed(
                            context, RouteNamed.forgotPasswordVerifyOtpPage);
                      },
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, PageName.loginPage);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 30, left: 8, right: 8),
                  child: Text(
                    'Return to Log in',
                    style: (TextStyle(
                        color: Color(0xFF9D170F),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF9D170F),
                        fontSize: 15)),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
