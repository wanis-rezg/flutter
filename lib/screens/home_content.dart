// screens/home/home_content.dart
import 'package:flutter/material.dart';
import 'package:shop_app/app_localizations.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';
import '../../widgets/category_item.dart';

class HomeContent extends StatelessWidget {
    HomeContent({super.key});


  final List<Product> products = [
    Product(
      imagePath: "assets/images/victus.png",
      name: "Hp victus",
      price: "1200\$",
      description: "High-performance gaming laptop with the latest specs.",
      specifications: [
        "Processor: Intel Core i7",
        "RAM: 16GB",
        "Storage: 512GB SSD",
        "Graphics: NVIDIA RTX 3060",
        
      ],
    ),
    Product(
      imagePath: "assets/images/S25Ultra.png",
      name: "Samsung S25 Ultra",
      price: "800\$",
      description: "Flagship smartphone with advanced camera features.",
      specifications: [
        "Display: 6.8-inch AMOLED",
        "Camera: 108MP",
        "Battery: 5000mAh",
        "Processor: Exynos 2200",
      ],
    ),
    Product(
      imagePath: "assets/images/Asus.png",
      name: "Asus Monitor 27",
      price: "800\$",
      description: "High-quality monitor with a 27-inch display.",
      specifications: [
        "Display: 27-inch",
        "Refresh rate: 60Hz",
        "Panel: IPS",
      ],
    ),
     Product(
      imagePath: "assets/images/S25Ultra.png",
      name: "Samsung S25 Ultra",
      price: "800\$",
      description: "Flagship smartphone with advanced camera features.",
      specifications: [
        "Display: 6.8-inch AMOLED",
        "Camera: 108MP",
        "Battery: 5000mAh",
        "Processor: Exynos 2200",
      ],
    ),
    Product(
  imagePath: "assets/images/iphone16.png",
  name: "iPhone 16 Pro Max",
  price: "1099\$",
  description: "The latest iPhone with an upgraded camera system, A17 chip, and enhanced display.",
  specifications: [
    "Display: 6.7-inch Super Retina XDR OLED",
    "Camera: 200MP Triple-camera system with LiDAR",
    "Battery: 4500mAh",
    "Processor: A17 Bionic chip",
    "Storage options: 128GB, 256GB, 512GB, 1TB",
    "5G Connectivity: Yes",
  ],
),

     Product(
      imagePath: "assets/images/watche.png",
      name: "Samsung S25 Ultra",
      price: "800\$",
      description: "Flagship smartphone with advanced camera features.",
      specifications: [
        "Display: 6.8-inch AMOLED",
        "Camera: 108MP",
        "Battery: 5000mAh",
        "Processor: Exynos 2200",
      ],
    ),
     Product(
      imagePath: "assets/images/S25Ultra.png",
      name: "Samsung S25 Ultra",
      price: "800\$",
      description: "Flagship smartphone with advanced camera features.",
      specifications: [
        "Display: 6.8-inch AMOLED",
        "Camera: 108MP",
        "Battery: 5000mAh",
        "Processor: Exynos 2200",
      ],
    ),
     Product(
      imagePath: "assets/images/S25Ultra.png",
      name: "Samsung S25 Ultra",
      price: "800\$",
      description: "Flagship smartphone with advanced camera features.",
      specifications: [
        "Display: 6.8-inch AMOLED",
        "Camera: 108MP",
        "Battery: 5000mAh",
        "Processor: Exynos 2200",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        
        children: [
        
          SizedBox(height: 30),
          Text(
            localizations.translate("categories"),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                 CategoryItem(icon: Icons.laptop, title: localizations.translate("laptops")),
             CategoryItem(icon: Icons.phone_android, title: localizations.translate("smartphones")),
             CategoryItem(icon: Icons.monitor, title: localizations.translate("monitors")),
             CategoryItem(icon: Icons.tablet_android, title: localizations.translate("tablets")),
             CategoryItem(icon: Icons.watch, title: localizations.translate("watches")),
             CategoryItem(icon: Icons.lightbulb, title: localizations.translate("lighting")),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
  localizations.translate("bestSelling"),
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),

          SizedBox(height: 20),
          
          GridView.count(
            
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: products
                .map((product) => ProductCard(product: product))
                .toList(),
          ),
        ],
      ),
    );
  }
}
