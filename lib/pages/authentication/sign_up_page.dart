import 'package:flutter/material.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/assets_management.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  final keyOfRegister = GlobalKey<FormState>();
  bool showHideIcon = false;
  bool showHidePassword = true;
  bool showHideIconConfirmPassword = false;
  bool showHidePasswordConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF5F5),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Form(
              key: keyOfRegister,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Image.asset(AssetsManagement.logoWithText),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintText: '\t\tFull name',
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            onSaved: (newValue) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Full name can\'t be empty';
                              }
                              RegExp fullNameExp =
                              RegExp('^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}\$');
                              if (!fullNameExp!.hasMatch(value)) {
                                return 'Your full name is invalid';
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintText: '\t\tPhone number',
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number can\'t be empty';
                              }
                              RegExp phoneNumberExp =
                              RegExp('^[+]?[0-9]{9,15}\$');
                              if (!phoneNumberExp!.hasMatch(value)) {
                                return 'Your number phone is invalid';
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintText: '\t\tEmail',
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email can\'t be empty';
                              }
                              RegExp emailExp = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (!emailExp!.hasMatch(value)) {
                                return 'Your Email is invalid';
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showHideIcon = !showHideIcon;
                                        showHidePassword = !showHidePassword;
                                      });
                                    },
                                    icon: Icon(showHideIcon
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                filled: true,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintText: '\t\tPassword',
                                hintStyle: const TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can\'t be empty';
                              }
                              RegExp passwordExp = RegExp(
                                  '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,18}\$');
                              if (!passwordExp!.hasMatch(value)) {
                                return 'Your password phone is invalid';
                              }
                            },
                            obscuringCharacter: '*',
                            obscureText: showHidePassword,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showHideIconConfirmPassword =
                                        !showHideIconConfirmPassword;
                                        showHidePasswordConfirm =
                                        !showHidePasswordConfirm;
                                      });
                                    },
                                    icon: Icon(showHideIconConfirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                filled: true,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintText: '\t\tConfirm password',
                                hintStyle: const TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password can\'t be empty';
                              }
                              if (value != passwordController.text) {
                                return 'Confirm Password is not same password';
                              }
                            },
                            obscuringCharacter: '*',
                            obscureText: showHidePasswordConfirm,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 45, left: 8, right: 8, bottom: 8),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.white,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {});
                                keyOfRegister.currentState!.validate();
                                keyOfRegister.currentState!.save();
                                if (keyOfRegister.currentState!.validate() ==
                                    true) {
                                  // Navigator.pushNamed(
                                  //     context, PageName.loginPage);
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    ContinuousRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF9D170F)),
                              ),
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNamed.loginPage);
                          },
                          child: const Text(
                            'Already have account? Log in',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF9D170F),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF9D170F)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}