import 'package:flutter/material.dart';
import 'package:shop_app/app_localizations.dart';
import 'package:shop_app/screens/cart_page.dart';
import 'package:shop_app/screens/search_page.dart';
import 'home_content.dart';

import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;


  bool _didInit = false;


  final List<Widget> _pages = [
    HomeContent(),
   const CartPage(),
    SearchPage(products: HomeContent().products)
   
  ];

  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  if (!_didInit) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      _currentIndex = args;
    }
    _didInit = true;
  }
}

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localizations = AppLocalizations.of(context)!;
    
    
    String getTitle() {
      switch (_currentIndex) {
        case 1:
          return localizations.translate("cart");
        case 2:
          return localizations.translate("search");
        default:
          return localizations.translate("home");
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(getTitle()),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(localizations.translate("home")),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(localizations.translate("settings")),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: Text(localizations.translate("darkMode")),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: themeProvider.isDarkMode
            ? const Color.fromARGB(255, 119, 118, 118)
            : const Color.fromARGB(255, 119, 118, 118),
        selectedItemColor:themeProvider.isDarkMode
            ? const Color.fromARGB(255, 255, 252, 252)
            : const Color.fromARGB(255, 0, 0, 0),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: localizations.translate("home")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: localizations.translate("cart")),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: localizations.translate("search")),
        ],
      ),
    );
  }
}
