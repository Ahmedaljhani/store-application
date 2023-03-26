import 'package:first_class/category_screen.dart';
import 'package:first_class/provider/productsdatabase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class WallScreen extends StatefulWidget {
  const WallScreen({Key? key}) : super(key: key);

  @override
  State<WallScreen> createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  @override
  Widget build(BuildContext context) {
    ProductsDataBBaseProvider watcher =
        context.watch<ProductsDataBBaseProvider>();
    ProductsDataBBaseProvider provider =
        context.read<ProductsDataBBaseProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0,top: 5),
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    print(provider.count);
                    // Navigate to the cart screen
                  },
                ),
                Positioned(
                  right: 3,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      provider.count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryScreen()),
          );
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: provider.products == null
          ? const Center(
              child: Text(
              "No items",
              style: TextStyle(fontSize: 32),
            ))
          : Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // int id = provider.products?[index]['id'];
                        // provider.deleteProducts(id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0,left: 6.0),
                        child: Card(elevation: 4,
                          child: ListTile(
                            shape: const RoundedRectangleBorder(),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      int x = int.parse(
                                          provider.products?[index]['amount']);
                                      print("amount is$x");
                                      x++;
                                      provider.editProducts(
                                          provider.products![index]['id'],
                                          x.toString());
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  iconSize: 20,
                                ),
                                Text(provider.products?[index]['amount']),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        int y = int.parse(
                                            provider.products?[index]['amount']);

                                        if (y > 1) {
                                          y--;
                                          provider.editProducts(
                                              provider.products![index]['id'],
                                              y.toString());
                                        } else if (y == 1) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Delete item ?"),
                                                content: Text(
                                                    "Are you sure you want to delete this item ?"),
                                                actions: [
                                                  TextButton(
                                                    child: Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("Delete"),
                                                    onPressed: () {
                                                      // widget.onDelete();
                                                      int id = provider.products?[index]['id'];
                                                      provider.deleteProducts(id);
                                                      provider.count--;
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                        }

                                      });
                                    },
                                    icon: Icon(Icons.remove))
                              ],
                            ),
                            // IconButton(onPressed: () {
                            //   var x = provider.products?[index]['name'];
                            //   var y = provider.products?[index]['price'];
                            //   print(x);
                            //   print(y);
                            //   print(provider.products?[index]['amount']);
                            // }, icon:Icon(Icons.edit) ,),
                            leading:
                                Container(height:60,width:60,child: Image.network(provider.products?[index]['image'],fit: BoxFit.fill,)),
                            title: Flexible(
                              child: Text(
                                provider.products?[index]['name'] ?? "",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            subtitle: Text(provider.products?[index]['price'] ?? ""),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: provider.products!.length),
          ),
    );
  }
}
