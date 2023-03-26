import 'package:first_class/productdetiles_screen.dart';
import 'package:first_class/provider/category_provider.dart';
import 'package:first_class/provider/productcat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.data}) : super(key: key);
 final String data;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  @override
  void initState() {
    var path =widget.data;
    print("initState");
    //context.read<PostsProvider>().getPosts();
    context.read<ProductCatProvider>().refresh();
    context.read<ProductCatProvider>().getProductCat(path);
    print(path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var path =widget.data;
    // context.read<ProductCatProvider>().getProductCat(path);
    var prodCatProvider = context.watch<ProductCatProvider>();
    var prodCatResponse = prodCatProvider.data;
    String _searchText = '';

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
                  child:prodCatResponse==null ? CircularProgressIndicator() : ListView.separated(
                    itemCount: prodCatResponse!.length,
                    itemBuilder: (context, index) {
                      final product = prodCatResponse[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(elevation: 2.0,
                          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                          child: ListTile(
                            // trailing: Image.network(prodResponse[index].image ??""),
                            leading: Image.network(prodCatResponse?[index].image ?? ""),
                            trailing: IconButton(  onPressed: () {  }, icon:Icon(Icons.arrow_forward_ios) ,),
                            title: Text(
                              prodCatResponse?[index].title  ?? "",
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text("${prodCatResponse?[index].price.toString() ?? ""} dl " ),
                            // trailing: Text('\$${product.price}'),
                            onTap: () {
                              // handle tapping on a product here
                              var idpath=prodCatResponse[index].id;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductDetilesScreen(data: idpath.toString())),
                              );
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
