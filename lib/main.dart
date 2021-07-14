import 'package:flutter/material.dart';
import 'package:hairlogistics/constants.dart';
import 'package:hairlogistics/providers/cartProvider.dart';
import 'package:hairlogistics/screens/home/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
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
          home: HomeScreen(),
        );
      },
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
    );
  }
}
