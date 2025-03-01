import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqh_rommel/config/router/app_router.dart';


void main() async{

final envFile = File('.env');
  if (envFile.existsSync()) {
    print('El archivo .env existe y contiene:');
    print(envFile.readAsStringSync());
  } else {
    print('⚠️ El archivo .env NO fue encontrado');
  }


  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MQH CBTIS62',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routerConfig: appRouter,     
    );
  }
}
