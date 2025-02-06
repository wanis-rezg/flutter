import 'package:flutter/material.dart';
import 'package:shop_app/app_localizations.dart';
import '../../models/product.dart';
class SearchPage extends StatefulWidget {
  final List<Product> products;

  const SearchPage({super.key, required this.products});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = widget.products;
  }

  void _searchProducts(String query) {
    setState(() {
      _filteredProducts = widget.products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: localizations.translate("search"),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _searchProducts,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(4),
                  
                  child: Card(
                   margin: const EdgeInsets.all(5),
                    child:   ListTile(
                    leading: Image.asset(
                      product.imagePath,
                     
                  
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.price),
                    onTap: () {
                
                      Navigator.pushNamed(context, "/productDetails", arguments: product);
                    },
                  )
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}