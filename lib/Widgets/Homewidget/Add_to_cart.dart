import 'package:catalog/core/store.dart';
import 'package:catalog/models/Cart.dart';
import 'package:catalog/models/cataog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).buttonColor)),
      onPressed: () {
        if (!isInCart) {
          //isInCart = isInCart.toggle();
          AddMutation(catalog);
          //setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart),
    );
  }
}
