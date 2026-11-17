import 'package:esilv_shop/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => Cart(),
    child: EsilvShop(),
  ));
}
