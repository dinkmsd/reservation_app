import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/authentication_bloc.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/routes/routes_management.dart';
import 'package:reservation_app/services/local_storage/app_shared_preference.dart';
import 'package:reservation_app/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final bool? isShownOnBoarding = await AppSharedPreference.readOnBoardingData();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(
    isShownOnBoarding: isShownOnBoarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isShownOnBoarding});

  final bool? isShownOnBoarding;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: isShownOnBoarding == true
            ? RouteNamed.homePage
            : RouteNamed.onBoardingPage,
        onGenerateRoute: (settings) => RouteManager.routeManagement(settings),
      ),
    );
  }
}
