import 'package:first_class/product_screen.dart';
import 'package:first_class/provider/category_provider.dart';
import 'package:first_class/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    print("initState");
    //context.read<PostsProvider>().getPosts();
    context.read<CategoryProvider>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final catgoryController = TextEditingController();
    String _searchText = '';
    var prodProvider = context.watch<CategoryProvider>();
    var prodResponse = prodProvider.data;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchText.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _searchText = '';
                                });
                              },
                            ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: Container(
                  alignment: AlignmentDirectional.topCenter,
                  width: double.infinity,
                  color: Colors.white,
                  child:prodResponse==null ? Center(child: CircularProgressIndicator()) : ListView.separated(
                    itemCount: prodResponse!.length,
                    itemBuilder: (context, index) {
                      final product = prodResponse[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: ListTile(
                            // trailing: Image.network(prodResponse[index].image ??""),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                            title: Text(
                              prodResponse[index] ?? "",
                              style: TextStyle(fontSize: 25),
                            ),
                            subtitle: Text(product ?? ""),
                            // trailing: Text('\$${product.price}'),
                            onTap: () {
                              var x = prodResponse[index];
                              var path = "";
                              switch (x) {
                                case "electronics":
                                  path =
                                      "https://fakestoreapi.com/products/category/electronics";
                                  break;
                                case "jewelery":
                                  path =
                                      "https://fakestoreapi.com/products/category/jewelery";
                                  break;
                                case "men's clothing":
                                  path =
                                      "https://fakestoreapi.com/products/category/men's clothing";
                                  break;
                                case "women's clothing":
                                  path =
                                      "https://fakestoreapi.com/products/category/women's clothing";
                                  break;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductScreen(data: path)),
                              );
                              // handle tapping on a product here
                              //
                            },
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 0),
                    separatorBuilder: (context, index) => Divider(),
                    scrollDirection: Axis.vertical,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
