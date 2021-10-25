
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog/models/Cart.dart';
import 'package:catalog/models/cataog.dart';

class MyStore extends VxStore {
  
    late CatalogModel catalog;
    late CartModel cart;
  MyStore(){
    
    catalog = CatalogModel();
    cart = CartModel();
    cart.ncatalog = catalog;
  }
}
