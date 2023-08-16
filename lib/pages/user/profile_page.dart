import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/authentication_bloc.dart';
import 'package:reservation_app/data/user_model.dart';
import 'package:reservation_app/utils/assets_management.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
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
            "Edit Profile",
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
                var userModel = UserModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text);

                context
                    .read<AuthenticationBloc>()
                    .add(AuthInfoChanged(userModel: userModel));

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Edit user info success!'),
                ));
                Navigator.pop(context);
              }
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthLoginSuccess) {
                nameController.text = state.userData?.name ?? '';
                phoneController.text = state.userData?.phone ?? '';
                emailController.text = state.userData?.email ?? '';
              }
              return Container(
                color: const Color.fromARGB(255, 246, 239, 231),
                height: MediaQuery.of(context).size.height,
                child: Column(
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
                          child: Stack(
                            children: [
                              Image.asset(
                                AssetsManagement.avatar,
                                fit: BoxFit.contain,
                                height: 160,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                height: 170,
                                width: 150,
                                child: IconButton(
                                    onPressed: () {},
                                    icon:
                                        Image.asset(AssetsManagement.editLogo)),
                              )
                            ],
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
                                controller: nameController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    suffixIcon:
                                        Image.asset(AssetsManagement.editLogo),
                                    hintText: "Name",
                                    hintStyle: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 16,
                                    )),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Not null";
                                  }
                                  RegExp regex = RegExp(r"^[a-zA-Z\s]+$");
                                  if (!regex.hasMatch(value)) {
                                    return "Invalid";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    suffixIcon:
                                        Image.asset(AssetsManagement.editLogo),
                                    hintText: "Phone",
                                    hintStyle: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 16,
                                    )),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Not null";
                                  }
                                  RegExp regex = RegExp(r"^\+?\d{10,}$");
                                  if (!regex.hasMatch(value)) {
                                    return "Invalid";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon:
                                        Image.asset(AssetsManagement.editLogo),
                                    hintText: "Email",
                                    hintStyle: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 16,
                                    )),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Not null";
                                  }
                                  RegExp regex = RegExp(r"^\w+@\w+(\.\w+)+$");
                                  if (!regex.hasMatch(value)) {
                                    return "Invalid";
                                  }
                                  return null;
                                },
                              )
                            ],
                          )),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
