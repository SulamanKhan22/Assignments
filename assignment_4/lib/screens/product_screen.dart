import 'package:assignment_4/api/dio_api.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic>? products;
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final List? fetchedProducts = await ProductService.fetchProducts();

      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  // Rest of the ProductScreen implementation...

  List<dynamic> getFilteredProducts() {
    if (selectedCategory == 'All') {
      return products!;
    } else {
      return products!.where((product) => product['category']['name'] == selectedCategory).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
        centerTitle: true,
      ),
      body: products == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Category buttons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCategoryButton('All', Icons.all_inclusive, const Color.fromARGB(255, 127, 172, 210)),
                        buildCategoryButton('Clothes', Icons.shopping_bag, const Color.fromARGB(255, 98, 122, 99)),
                        buildCategoryButton('Electronics', Icons.electrical_services, const Color.fromARGB(255, 216, 189, 148)),
                        buildCategoryButton('Shoes', Icons.shopping_bag_outlined, const Color.fromARGB(255, 160, 148, 130)),
                        // Add more category buttons as needed
                      ],
                    ),
                  ),
                ),

                // Products List
                Expanded(
                  child: getFilteredProducts().isEmpty
                      ? const Center(
                          child: Text('No items found for the selected category.'),
                        )
                      : ListView.builder(
                          itemCount: getFilteredProducts().length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = getFilteredProducts()[index];
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Card(
                                elevation: 10,
                                color: Colors.grey[400],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          height: 300.0,
                                          viewportFraction: 1.0,
                                          enableInfiniteScroll: false,
                                        ),
                                        items: (product['images'] as List<dynamic>).map<Widget>((image) {
                                          return Image.network(
                                            image,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product['title'],
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Price: \$${product['price']}',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product['description'],
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Implement your add to cart logic here
                                          // You might want to navigate to a cart screen or perform other actions
                                        },
                                        child: const Text('Add to Cart'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  Widget buildCategoryButton(String category, IconData icon, Color buttonColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = category;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8.0),
            Text(category),
          ],
        ),
      ),
    );
  }
}
