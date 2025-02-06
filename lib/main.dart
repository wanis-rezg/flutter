import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/cart_page.dart';
import 'package:shop_app/screens/home_page.dart';
import 'package:shop_app/screens/product_details_page.dart';
import 'package:shop_app/screens/settings_page.dart';
import 'providers/locale_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/cart_provider.dart';


import 'app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      locale: localeProvider.locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate, 
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomePage(),
      routes: {
       "/home": (context) => const HomePage(),
       "/cart": (context) =>  CartPage(),
       "/settings": (context) =>  SettingsPage(),
       "/productDetails": (context) => ProductDetailsPage(
    product: ModalRoute.of(context)!.settings.arguments as Product,
  ),


      },
    );
  }
}
