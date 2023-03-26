import 'package:first_class/provider/category_provider.dart';
import 'package:first_class/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  //List<dynamic>? response;

  @override
  void initState() {
    super.initState();
    print("initState");
    //context.read<PostsProvider>().getPosts();
    context.read<ProductsProvider>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    //var provider = context.watch<PostsProvider>();
    //var response = provider.data;
    var prodProvider = context.watch<ProductsProvider>();
    var prodResponse = prodProvider.data;

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: prodResponse == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(prodResponse[index].image ?? ""),
                  title: Text(prodResponse[index].title ?? "null" ,style: TextStyle(fontSize: 12),),
                  subtitle: Text("Price : ""${prodResponse[index].price?? "null"}"" dl"),

                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: prodResponse!.length),
    );
  }
}
