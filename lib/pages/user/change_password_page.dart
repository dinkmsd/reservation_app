import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/authentication_bloc.dart';
import 'package:reservation_app/data/user_model.dart';
import 'package:reservation_app/utils/assets_management.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController currentController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Change password",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              alignment: Alignment.center,
              child: const Text(
                "Done",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            onTap: () async {
              if (_keyForm.currentState!.validate()) {
                context.read<AuthenticationBloc>().add(AuthInfoChanged(
                    userModel: UserModel(password: newController.text)));
                Navigator.pop(context);
              }
            },
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: const Color.fromARGB(255, 246, 239, 231),
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                var data = UserModel();
                if (state is AuthLoginSuccess) {
                  data = state.userData ?? UserModel();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          color: Colors.white,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Image.asset(
                            data.avatarPath ?? AssetsManagement.avatar,
                            fit: BoxFit.contain,
                            height: 160,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                          key: _keyForm,
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: currentController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      suffixIcon: Image.asset(
                                          AssetsManagement.editLogo),
                                      hintText: "Current Password",
                                      hintStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontSize: 16,
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password can\'t be empty';
                                    }
                                    RegExp passwordExp = RegExp(
                                        '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,18}\$');
                                    if (!passwordExp!.hasMatch(value)) {
                                      return 'Your password phone is invalid';
                                    }
                                    if (value != data.password) {
                                      return "Current password incorrect";
                                    }
                                    return null;
                                  },
                                  obscuringCharacter: '*',
                                  obscureText: true),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  controller: newController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      suffixIcon: Image.asset(
                                          AssetsManagement.editLogo),
                                      hintText: "New Password",
                                      hintStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontSize: 16,
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Not null";
                                    }
                                    RegExp regex = RegExp(
                                        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{9,17}$");
                                    if (!regex.hasMatch(value)) {
                                      return "Invalid";
                                    }
                                    return null;
                                  },
                                  obscuringCharacter: '*',
                                  obscureText: true),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  controller: confirmController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: Image.asset(
                                          AssetsManagement.editLogo),
                                      hintText: "Confirm New Password",
                                      hintStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontSize: 16,
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Not null";
                                    }
                                    if (value != newController.text) {
                                      return "Confirm password incorrect";
                                    }
                                    return null;
                                  },
                                  obscuringCharacter: '*',
                                  obscureText: true)
                            ],
                          )),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
