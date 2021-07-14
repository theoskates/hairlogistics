import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:hairlogistics/constants.dart';
//import 'package:hairlogistics/constants.dart';
import 'package:hairlogistics/models/Product.dart';
import 'package:hairlogistics/screens/details/components/productTitleWithImage.dart';
import 'package:hairlogistics/screens/details/components/colorAndSize.dart';

// import 'CartCounter.dart';
import 'CounterWithFavBut.dart';
import 'addToCart.dart';
import 'decription.dart';

class Body extends StatelessWidget {
  final Product products;

  const Body({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: size.height * 0.3,
                  ),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(products: products),
                      SizedBox(height: kDefaultPadding/2,),
                      Description(products: products),
                      SizedBox(height: kDefaultPadding/2,),
                      CounterWithFavBut(),
                      SizedBox(height: kDefaultPadding/2,),
                      AddToCart(
                       product: this.products, 
                      ),
                    ],
                  ),
                ),
                ProductTitleWithImage(products: products)
              ],
            ),
          )
        ],
      ),
    );
  }
}

