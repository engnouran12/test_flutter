import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/controller/auth_provider.dart';
import 'package:test/presentation/controller/order_view_provider.dart' show OrderProvider;
import 'package:test/presentation/views/Auth_feature/login_screen.dart';
import 'package:test/presentation/views/order_view_feature/order_screen.dart';

import 'data/repositories/local_repo/cashe_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();


  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final token= await CacheHelper.getToken();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
      ChangeNotifierProvider(
      create: (_) => OrderProvider(),),
      ChangeNotifierProvider(create: (_) =>
        AuthProvider(),)
    ],
    ////
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token != null ? OrderScreen() : LoginScreen(),  // Fixed conditional navigation

      ));

  }
}

