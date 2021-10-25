import 'package:catalog/core/store.dart';
import 'package:catalog/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, right: 32, left: 32),
              child: CartList(),
            ),
          ),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("cart Total Rebuild");
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Price(cart: _cart),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).buttonColor),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Buying Not supported yet')));
                  },
                  child: Text('BUY')),
            ),
          ],
        ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  Price({
    Key? key,
    required CartModel cart,
  }) : super(key: key);

  final CartModel _cart = (VxState.store as MyStore).cart;
  
  @override
  Widget build(BuildContext context) {
    print ("price rebuild");
    VxState.watch(context, on: [RemoveMutation]);
    return Text(
      
      '\$${_cart.totalPrice}',
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: Theme.of(context).accentColor),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 final CartModel _cart = (VxState.store as MyStore).cart;
  VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? Center(
            child: Text(
            "Nothing to show",
            style: TextStyle(fontSize: 25),
          ))
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  //_cart.remove(_cart.items[index]);
                  //setState(() {});
                },
              ),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
