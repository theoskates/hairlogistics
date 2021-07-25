import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hairlogistics/constants.dart';
import 'package:hairlogistics/models/Product.dart';
import 'package:hairlogistics/screens/details/components/body.dart';

class DeatailsScreen extends StatelessWidget {
  final Product product;

  const DeatailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: buildAppBar(context),
      body: Body(
        products: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0.0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        // IconButton(
        // icon: SvgPicture.asset("assets/icons/search.svg"),
        // IconButton(
        //     icon: SvgPicture.asset("assets/icons/shopping_cart.svg"),
        //     onPressed: () {}),  //   onPressed: () {}),
        // IconButton(
        //     icon: SvgPicture.asset("assets/icons/shopping_cart.svg"),
        //     onPressed: () {}),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

