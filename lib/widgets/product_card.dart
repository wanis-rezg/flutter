// widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/theme_provider.dart';
import '../models/product.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/productDetails",
            arguments: product, // تمرير المنتج كـ arguments
          );
        },
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
              
              height: 100,
          
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:themeProvider.isDarkMode ? const Color.fromARGB(255, 175, 172, 172): Colors.grey[800],
                ),
              ),
            ),
               Text(
                product.price,
                style: TextStyle(
                  color:themeProvider.isDarkMode ? const Color.fromARGB(255, 175, 172, 172): Colors.grey[600],
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}