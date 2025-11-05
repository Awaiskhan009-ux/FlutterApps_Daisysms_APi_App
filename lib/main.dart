  import 'package:flutter/material.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'package:flutter_application_2/provider/login_screen_provider.dart';
  import 'package:flutter_application_2/views/login_screen.dart';
  import 'package:flutter_application_2/views/signup_screen.dart';
  import 'package:provider/provider.dart';
  import 'firebase_options.dart'; 
  import 'package:flutter_application_2/views/splash_screen.dart';


  void main() async {
    WidgetsFlutterBinding.ensureInitialized(); 

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers:[
  ChangeNotifierProvider(create: (_)=> AuthProvider())
        ],
        child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const SplashScreen(),




        
      
      ),
      );
    }
  }
