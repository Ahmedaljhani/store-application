import 'package:first_class/provider/productcat_provider.dart';
import 'package:first_class/provider/productdet_provider.dart';
import 'package:first_class/provider/productsdatabase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductDetilesScreen extends StatefulWidget {
  const ProductDetilesScreen({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  State<ProductDetilesScreen> createState() => _ProductDetilesScreenState();
}

class _ProductDetilesScreenState extends State<ProductDetilesScreen> {
  //rate icons
  var icontop = Icons.favorite_border;
  var iconstar = Icons.star_border_outlined;
  var iconstar1 = Icons.star_border_outlined;
  var iconstar2 = Icons.star_border_outlined;
  var iconstar3 = Icons.star_border_outlined;
  var iconstar4 = Icons.star_border_outlined;

  @override
  void initState() {
    var path = widget.data;
    var pathdet = 'https://fakestoreapi.com/products/$path';
    print("initState");
    //context.read<PostsProvider>().getPosts();
    context.read<ProductDetProvider>().refresh();
    context.read<ProductDetProvider>().getProductDet(pathdet);
    print(pathdet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductsDataBBaseProvider watcher =
        context.watch<ProductsDataBBaseProvider>();
    ProductsDataBBaseProvider provider =
        context.read<ProductsDataBBaseProvider>();

    var prodDetProvider = context.watch<ProductDetProvider>();
    var prodDetResponse = prodDetProvider.data;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {
                  if (icontop == Icons.favorite_border) {
                    icontop = Icons.favorite;
                  } else {
                    icontop = Icons.favorite_border;
                  }
                  setState(() {});
                },
                icon: Icon(icontop)),
          )
        ],
      ),
      body: prodDetResponse == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: prodDetResponse == null
                              ? CircularProgressIndicator()
                              : Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              width: 200,
                                              height: 200,
                                              child: Image.network(
                                                prodDetResponse?.image ?? "",
                                                fit: BoxFit.fill,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, right: 18.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4.0,
                                                              left: 10.0,
                                                              top: 12.0),
                                                      child: Text(
                                                        (prodDetResponse?.title ??
                                                            ""),
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Raleway'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("200 dl",
                                                      style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        if (iconstar ==
                                                            Icons
                                                                .star_border_outlined) {
                                                          iconstar =
                                                              Icons.star_half;
                                                        } else if (iconstar ==
                                                            Icons.star_half) {
                                                          iconstar = Icons.star;
                                                        } else if (iconstar ==
                                                            Icons.star) {
                                                          iconstar = Icons
                                                              .star_border_outlined;
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(iconstar)),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (iconstar1 ==
                                                            Icons
                                                                .star_border_outlined) {
                                                          iconstar1 =
                                                              Icons.star_half;
                                                        } else if (iconstar1 ==
                                                            Icons.star_half) {
                                                          iconstar1 = Icons.star;
                                                        } else if (iconstar1 ==
                                                            Icons.star) {
                                                          iconstar1 = Icons
                                                              .star_border_outlined;
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(iconstar1)),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (iconstar2 ==
                                                            Icons
                                                                .star_border_outlined) {
                                                          iconstar2 =
                                                              Icons.star_half;
                                                        } else if (iconstar2 ==
                                                            Icons.star_half) {
                                                          iconstar2 = Icons.star;
                                                        } else if (iconstar2 ==
                                                            Icons.star) {
                                                          iconstar2 = Icons
                                                              .star_border_outlined;
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(iconstar2)),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (iconstar3 ==
                                                            Icons
                                                                .star_border_outlined) {
                                                          iconstar3 =
                                                              Icons.star_half;
                                                        } else if (iconstar3 ==
                                                            Icons.star_half) {
                                                          iconstar3 = Icons.star;
                                                        } else if (iconstar3 ==
                                                            Icons.star) {
                                                          iconstar3 = Icons
                                                              .star_border_outlined;
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(iconstar3)),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (iconstar4 ==
                                                            Icons
                                                                .star_border_outlined) {
                                                          iconstar4 =
                                                              Icons.star_half;
                                                        } else if (iconstar4 ==
                                                            Icons.star_half) {
                                                          iconstar4 = Icons.star;
                                                        } else if (iconstar4 ==
                                                            Icons.star) {
                                                          iconstar4 = Icons
                                                              .star_border_outlined;
                                                        }
                                                        setState(() {});
                                                      },
                                                      icon: Icon(iconstar4)),
                                                  Text(
                                                    prodDetResponse.rating?.rate
                                                        .toString() as String,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12.0,
                                                right: 12.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Description",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 40.0,
                                                  left: 40.0,
                                                  top: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      prodDetResponse
                                                              ?.description ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          overflow: TextOverflow
                                                              .visible),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.insertToDatabase(
                              prodDetResponse?.title ?? "",
                              prodDetResponse?.price.toString() ?? "",
                              prodDetResponse?.image.toString() ?? "",
                              "1");

                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.add_shopping_cart_outlined),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
    );
  }
}
