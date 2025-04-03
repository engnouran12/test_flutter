import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/controller/auth_provider.dart';
import 'package:test/presentation/views/Auth_feature/login_screen.dart';

import 'data/repositories/local_repo/cashe_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();


  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return         ChangeNotifierProvider(create: (_) =>
        AuthProvider(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,     home: LoginScreen()
      
      ));

  }
}

