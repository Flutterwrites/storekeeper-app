import 'package:flutter/material.dart';
import 'package:storekeeper/databasehelper.dart';
import 'package:storekeeper/models/products.dart';

import 'package:storekeeper/screens/addproduct.dart';
import 'package:storekeeper/Reusables/productcard.dart';
import 'package:storekeeper/Reusables/topbar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final data = await DatabaseHelper.instance.getProducts();
    setState(() {
      _products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProduct()),
          );
          _loadProducts();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TopBar(),
              const SizedBox(height: 15),

              Container(
                width: 343,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color(0xFFBBBBBB)),
                    hintText: 'Search your products',
                    hintStyle: TextStyle(
                      color: Color(0xFFBBBBBB),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                    suffixIcon: Icon(Icons.mic, color: Color(0xFFBBBBBB)),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: _products.isEmpty
                    ? const Center(
                        child: Text(
                          'No products available',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount: _products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.7,
                            ),
                        itemBuilder: (context, index) {
                          final product = _products[index];

                          return Productcard(
                            myText: product.name,
                            myPrice: 'AUD ${product.price}',
                            myQuantity: product.quantity.toString(),
                            myImage:
                                product.imagePath ?? 'images/placeholder.png',
                            isFromFile:
                                product.imagePath != null &&
                                !product.imagePath!.startsWith('images/'),

                            onEdit: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddProduct(productToEdit: product),
                                ),
                              );
                              _loadProducts();
                            },

                            onDelete: () async {
                              await DatabaseHelper.instance.deleteProduct(
                                product.id!,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Product deleted'),
                                ),
                              );
                              _loadProducts();
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
