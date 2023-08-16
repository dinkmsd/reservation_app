import 'package:flutter/material.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/assets_management.dart';


class ForgotPasswordSavePage extends StatefulWidget {
  const ForgotPasswordSavePage({super.key});

  @override
  State<ForgotPasswordSavePage> createState() => _ForgotPasswordSavePageState();
}

class _ForgotPasswordSavePageState extends State<ForgotPasswordSavePage> {
  final keySavePassword = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool showPassword = true;
  bool showPasswordIcon = true;
  bool showConfirmPassword = true;
  bool showConfirmPasswordIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keySavePassword,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManagement.logoWithText),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManagement.timelineStep3),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30,left: 8,right: 8),
                child: Text('Enter Your New PassWord',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
                child: ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscuringCharacter: '*',
                    obscureText: showPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: const TextStyle(
                          fontSize: 20, color: Colors.black54),
                      border: InputBorder.none,
                      fillColor: Colors.white,filled: true,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                              showPasswordIcon = !showPasswordIcon;
                            });
                          },
                          icon: Icon(showPasswordIcon
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can not be empty';
                      }
                      RegExp passwordExp = RegExp(
                          '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,18}\$');
                      if (!passwordExp!.hasMatch(value)) {
                        return 'Your Password is invalid';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
                child: ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscuringCharacter: '*',
                    obscureText: showConfirmPassword,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                            fontSize: 20, color: Colors.black54),
                        border: InputBorder.none,
                        fillColor: Colors.white,filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showConfirmPassword = !showConfirmPassword;
                              showConfirmPasswordIcon = !showConfirmPasswordIcon;
                            });
                          },
                          icon: Icon(showConfirmPasswordIcon
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can not be empty';
                      }
                      if (value != passwordController.text) {
                        return 'Password and Confirm Password not same';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15,
                    color: Colors.transparent,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF9D170F)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNamed.notifySaveSuccessPage);
                          // keySavePassword.currentState!.validate();
                          // if (keySavePassword.currentState!.validate() ==
                          //     true) {
                          //   // Navigator.pushNamed(
                          //   //     context, PageName.successChangePasswordPage);
                          // }
                        },
                        child: const Text(
                          'SAVE',
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
