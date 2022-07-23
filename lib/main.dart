import 'package:autism_project/screens/parent/sing_in/signin_view.dart';
import 'package:autism_project/shared/network/bloc_observer.dart';
import 'package:autism_project/shared/network/dio/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInParentLayout()
    );
  }
}

