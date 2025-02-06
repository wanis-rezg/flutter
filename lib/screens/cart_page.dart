import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart'; 
import '../providers/theme_provider.dart'; 

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cartProvider = context.watch<CartProvider>();
    final cartItems = cartProvider.cartItems;
    final cartList = cartItems.entries.toList();

    if (cartList.isEmpty) {
      return Scaffold(
        body: Center(child: Text("Your cart is empty")),
      );
    }


    return Scaffold(
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          final product = cartList[index].key;
          final quantity = cartList[index].value;
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/productDetails", arguments: product);
              },
              leading: Image.asset(
                product.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Text(
                product.price,
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.grey[600],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // زر تقليل الكمية
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      cartProvider.removeFromCart(product); 
                    },
                  ),
                  // عرض الكمية
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 16),
                  ),
                  // زر زيادة الكمية
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      cartProvider.addToCart(product); // زيادة الكمية
                    },
                  ),
                  //  زر حذف المنتج من السلة
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cartProvider.removeProduct(product); 
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}