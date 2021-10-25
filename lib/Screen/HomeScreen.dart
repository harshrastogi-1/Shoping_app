import 'dart:convert';
import 'package:catalog/Widgets/Homewidget/Catalog.dart';
import 'package:catalog/Widgets/Homewidget/Cataloglist.dart';
import 'package:catalog/core/store.dart';
import 'package:catalog/models/Cart.dart';
import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:catalog/models/cataog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url="https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() { 
    loaddata();
    super.initState();
  }

  loaddata() async {
    // final catalogjson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogjson=response.body;
    final decodedData = jsonDecode(catalogjson);
    var productdata = decodedData['products'];
    CatalogModel.items =
        List.from(productdata).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: FloatingBadge(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                CatalogModel.items.isNotEmpty
                    ? Expanded(
                        child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CatalogList(),
                      ))
                    : Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
              ],
            ),
          ),
        ));
    // return Scaffold(
    //   backgroundColor: Theme.of(context).backgroundColor,
    //   appBar: AppBar(
    //     title: Text('Catalog'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Catalog.itmes.isNotEmpty
    //         ? GridView.builder(

    //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               mainAxisSpacing: 16,
    //               crossAxisSpacing: 16,

    //             ),
    //             itemCount: Catalog.itmes.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               final item = Catalog.itmes[index];
    //               return Card(
    //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //                 clipBehavior: Clip.antiAlias,
    //                 child: GridTile(
    //                   header: Container(
    //                     padding: EdgeInsets.all(10),
    //                     decoration: BoxDecoration(
    //                       color: Theme.of(context).primaryColor
    //                     ),
    //                     child: Text(item.name,style: TextStyle(color: Theme.of(context).backgroundColor),)),
    //                   child: Image.network(item.image),
    //                   footer: Text(item.price.toString()),
    //                   ));
    //             },
    //           )
    // ? ListView.builder(
    //     itemCount: Catalog.itmes.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ItemWidget(
    //         item: Catalog.itmes[index],
    //       );
    //     },
    //   )
    //         : Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //   ),
    //   drawer: MyDrawer(),
    // );
  }
}

class FloatingBadge extends StatelessWidget {
  const FloatingBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    return FloatingActionButton(
      backgroundColor: Theme.of(context).buttonColor,
      onPressed: () => Navigator.pushNamed(context, Myroutes.myCartScreen),
      child: Icon(
        Icons.shopping_cart_sharp,
        color: Colors.white,
      ),
    ).badge(
          
          size: 25,
          count: _cart.items.length,textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)

        );
  }
}
