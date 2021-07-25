import 'package:flutter/material.dart';
import 'package:hairlogistics/constants.dart';
import 'package:hairlogistics/providers/cartProvider.dart';
import 'package:hairlogistics/screens/details/components/Authentication/signIn.dart';
import 'package:hairlogistics/screens/details/components/Authentication/signUp.dart';
import 'package:hairlogistics/screens/home/homescreen.dart';
import 'package:hairlogistics/screens/splash_screen/splash.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.blue,
          ),
          initialRoute: "/splash",
          routes: {
            "/splash": (context) => SplashScreen(),
            "/signIn": (context) => SignIn(),
            "/signUp": (context) => SignUp(),
          },
        );
      },
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
    );
  }
}
