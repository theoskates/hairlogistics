import 'package:flutter/material.dart';
import 'package:hairlogistics/providers/cartProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("Cart Items"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, widget) {
          var data = provider.getProduct;
          return Container(
            child: provider.getProduct.isEmpty
                ? Center(
                    child: Text("No Item Added"),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(data[index].id.toString()),
                        background: Container(
                          color: Colors.red,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.delete),
                          ),
                        ),
                        onDismissed: (dir) {
                          provider.removeFromCart(data[index]);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                              data[index].image,
                            ),
                          ),
                          title: Text(data[index].title),
                          trailing: Text("\$${data[index].price}"),
                          subtitle: Text(
                            data[index].description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
