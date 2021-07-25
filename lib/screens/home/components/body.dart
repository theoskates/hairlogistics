import 'package:flutter/material.dart';
import 'package:hairlogistics/constants.dart';
import 'package:hairlogistics/models/Product.dart';
import 'package:hairlogistics/screens/details/detailScreen.dart';
import 'package:hairlogistics/services/firebase_services.dart';

// import 'categories.dart';
import 'itemCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Hair Logistics",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        // Categories(),
        FutureBuilder<List<Product>>(
            future: FirebaseServices().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              if (snapshot.hasError)
                return Expanded(
                  child: Center(
                    child: Text(snapshot.error.toString()),
                  ),
                );
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                      childAspectRatio: .6,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      product: snapshot.data[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeatailsScreen(
                            product: snapshot.data[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}
