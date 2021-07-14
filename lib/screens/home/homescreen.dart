import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hairlogistics/constants.dart';
import 'package:hairlogistics/models/Product.dart';
import 'package:hairlogistics/providers/cartProvider.dart';
import 'package:hairlogistics/screens/Cart/cartScreen.dart';
import 'package:hairlogistics/screens/details/detailScreen.dart';
import 'package:hairlogistics/screens/home/components/body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final Product product;

  const HomeScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: Drawer(),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      // leading: IconButton(
      //     icon: SvgPicture.asset("assets/icons/back.svg"), onPressed: () {}),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            }),
        Stack(
          children: [
            IconButton(
                icon: SvgPicture.asset("assets/icons/shopping_cart.svg"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartScreen()));
                }),
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: Colors.red,
                child: Center(
                  child:
                      Consumer<CartProvider>(builder: (ctx, provider, widget) {
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
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

class DataSearch extends SearchDelegate<Product> {
  // final products = ["Astro", "Magna", "Service", "Laptop", "Desktop", "Phones"];

  // final recentProducts = [
  //   "Astro",
  //   "Magna",
  //   "Service",
  // ];
  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app Bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? products
        : products.where((element) => element.title.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeatailsScreen(product: products[index]),
            ),
          );
        },
        leading: Icon(Icons.history),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].title.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].title.substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for anything
    final suggestionList = query.isEmpty
        ? products
        : products.where((element) => element.title.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeatailsScreen(product: products[index]),
            ),
          );
        },
        leading: Icon(Icons.history),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].title.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].title.substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
