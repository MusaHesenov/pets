import 'package:Nestcare/combiner.dart';
import '../../repos/provider/auth_provider.dart' as auth;
import 'package:Nestcare/repos/provider/category_provider.dart';
import 'package:Nestcare/repos/provider/pet_provider.dart';
import 'package:Nestcare/screens/auth/first_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/routes.dart' as route;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => auth.AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: route.controller,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const FirstPage();
            }
            else{
              return const Combiner();
            }
          },
        ),
      ),
    );
  }
}
