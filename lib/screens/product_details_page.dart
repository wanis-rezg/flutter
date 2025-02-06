import 'package:flutter/material.dart';
import 'package:shop_app/app_localizations.dart';
import 'package:shop_app/models/comment.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/theme_provider.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        widget.product.comments = List.from(widget.product.comments)
          ..add(
            Comment(
              user: "User",
              text: _commentController.text,
              date: DateTime.now(),
            ),
          );
      });
      _commentController.clear(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate("title")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.product.imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.price,
                style: TextStyle(
                  fontSize: 20,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                localizations.translate("description"),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                localizations.translate("specifications"),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.product.specifications.map((spec) {
                  return Text(
                    "• $spec",
                    style: const TextStyle(fontSize: 16),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final isProductInCart = cartProvider.isProductInCart(widget.product);

                  return ElevatedButton(
                    onPressed: isProductInCart
                        ? () {
                            // التنقل إلى صفحة السلة
                            Navigator.pushNamed(context, "/home", arguments: 1);
                          }
                        : () {
                            cartProvider.addToCart(widget.product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${widget.product.name} added to cart!'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                    child: Text(
                      isProductInCart
                          ? localizations.translate("showInCart") // "Show in Cart"
                          : localizations.translate("addToCart"), // "Add to Cart"
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                localizations.translate("comments"),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.product.comments.length,
                itemBuilder: (context, index) {
                  final comment = widget.product.comments[index];
                  return ListTile(
                    title: Text(comment.user),
                    subtitle: Text(comment.text),
                    trailing: Text(
                      "${comment.date.day}/${comment.date.month}/${comment.date.year}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: localizations.translate("addComment"),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _addComment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
