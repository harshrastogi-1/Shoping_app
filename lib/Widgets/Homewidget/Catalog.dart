import 'package:flutter/material.dart';
class CatalogHeader extends StatelessWidget {
  //const ClassHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
              fontSize: 30),
        ),
        Text(
          "Treading Products",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
              fontSize: 15),
        )
      ],
    );
  }
}