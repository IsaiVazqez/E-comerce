import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/Cart/Presentation/providers/orders.dart';
import 'package:shop_app/features/Cart/Presentation/providers/cart.dart';
import 'package:shop_app/features/Products/presentation/provider/products.dart';
import 'package:shop_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_live_51LOOzzC1VEE2NdrBmIggAQl350wyicT8KXeyat7VKcgru4E6MKoEW5ec1Y0TB6Fi7jHMgsr8kQA5Rro7CZUjfwln00KYd3RUgv';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
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
        title: 'Shop App',
        initialRoute: 'ProductsView',
        routes: appRoutes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 255, 255, 255),
            secondary: const Color.fromARGB(255, 184, 193, 236),
          ),
          canvasColor: Colors.white,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 35, 41, 70),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              ),
        ),
      ),
    );
  }
}
