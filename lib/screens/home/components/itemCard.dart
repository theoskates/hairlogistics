import 'package:flutter/material.dart';
import 'package:hairlogistics/models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "${product.id}",
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          product.image,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
