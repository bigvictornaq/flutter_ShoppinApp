import 'package:flutter/material.dart';
import 'package:flutter_shopping/providers/cart.dart';
import 'package:flutter_shopping/providers/orders.dart';
import 'package:flutter_shopping/providers/product_provider.dart';
import 'package:flutter_shopping/screens/cart_screen.dart';
import 'package:flutter_shopping/screens/edit_product_screen.dart';
import 'package:flutter_shopping/screens/order_screen.dart';
import 'package:flutter_shopping/screens/product_detail_screen.dart';
import 'package:flutter_shopping/screens/product_overview_screen.dart';
import 'package:flutter_shopping/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.red.shade700,
            primaryColorDark: Colors.red.shade900,
            primaryColorLight: Colors.redAccent.shade200),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.ProductDetailScreenRoute: (context) =>
              const ProductDetailScreen(),
          CartScreen.CartScreenRoute: (context) => const CartScreen(),
          OrderScreen.OrderScreenRouteName: (context) => const OrderScreen(),
          UserProductsScreen.UserPrdtScreenRouteName: (context) =>
              const UserProductsScreen(),
          EditOrAddProductScreen.EditAddScreenRouteName: (context) =>
              const EditOrAddProductScreen(),
        },
      ),
    );
  }
}
