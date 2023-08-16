import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/authentication_bloc.dart';
import 'package:reservation_app/bloc/authentication_bloc.dart';
import 'package:reservation_app/pages/home/components/drawer/drawer_login.dart';
import 'package:reservation_app/pages/home/components/drawer/drawer_logout.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/utils/app_distance.dart';
import 'package:reservation_app/utils/assets_management.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery
            .sizeOf(context)
            .width - Dt.d_24,
        child: Scaffold(
            backgroundColor: const Color(0xFFFFF5F5),
            body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if(state is AuthLoginSuccess){
                  return DrawerLogin(userInfo: state.userData,);
                }else{
                  return const DrawerLogOut();
                }
              },
            )
        ));
  }
}
