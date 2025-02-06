// widgets/category_item.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/theme_provider.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? const Color.fromARGB(255, 28, 28, 28) : const Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(icon, size: 40),
            
            
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:themeProvider.isDarkMode ? const Color.fromARGB(255, 139, 137, 137): Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
