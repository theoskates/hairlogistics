import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hairlogistics/models/Product.dart';
import 'package:hairlogistics/providers/cartProvider.dart';
import 'package:hairlogistics/screens/Cart/cartScreen.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  final Product product;
  const AddToCart({
    this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.redAccent,
              ),
            ),
            child: Stack(
              children: [
                IconButton(
                    icon: SvgPicture.asset("assets/icons/shopping_cart.svg"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CartScreen()),
                      );
                    }),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Consumer<CartProvider>(
                          builder: (ctx, provider, widget) {
                        return Text(
                          provider.getProduct.length.toString(),
                          style: TextStyle(color: Colors.white),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child:
                  Consumer<CartProvider>(builder: (context, provider, widget) {
                bool contains = provider.getProduct
                    .where((element) => element.id == product.id)
                    .isNotEmpty;
                return TextButton(
                  child: Text(
                    contains ? 'Remove from Cart' : "Add to Cart".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (contains) {
                      provider.removeFromCart(product);
                      return;
                    }
                    provider.setProduct = this.product;
                  },
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
