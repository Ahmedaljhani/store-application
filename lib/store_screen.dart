import 'package:first_class/product_screen.dart';
import 'package:first_class/provider/productEc_provider.dart';
import 'package:first_class/provider/productMan_provider.dart';
import 'package:first_class/provider/productcat_provider.dart';
import 'package:first_class/provider/productjew_provider.dart';
import 'package:first_class/provider/products_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    super.initState();
    print("initState");

    //
    context.read<ProductManProvider>().refresh();
    context.read<ProductManProvider>().getProductMan(
        "https://fakestoreapi.com/products/category/men's clothing");
    //
    context.read<ProductJewProvider>().refresh();
    context
        .read<ProductJewProvider>()
        .getProductJew("https://fakestoreapi.com/products/category/jewelery");
    //
    context.read<ProductEcProvider>().refresh();
    context
        .read<ProductEcProvider>()
        .getProductEc("https://fakestoreapi.com/products/category/electronics");
  }

  @override
  Widget build(BuildContext context) {
    var prodManProvider = context.watch<ProductManProvider>();
    var prodManResponse = prodManProvider.data;
    var prodjprovider = context.watch<ProductJewProvider>();
    var prodjResponse = prodjprovider.data;
    var prodEprovider = context.watch<ProductEcProvider>();
    var prodEResponse = prodEprovider.data;

    return Scaffold(

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
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      elevation: 7,
                      shadowColor: Colors.grey,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.network(
                        'https://previews.123rf.com/images/ezthaiphoto/ezthaiphoto2007/ezthaiphoto200700010/150750833-sale-label-billbord-stand-template-in-clothing-store-for-sale-promotion-and-discount-information-for.jpg',
                        fit: BoxFit.fill,
                      ),
                      color: Colors.brown,
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, bottom: 0),
                            child: Text(
                              'Clothing',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MaterialButton(
                              highlightColor: Colors.white,
                              splashColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                          data:
                                              "https://fakestoreapi.com/products/category/men's clothing")),
                                );
                              },
                              child: Text(
                                "SeeAll",
                                style: TextStyle(color: Colors.indigo),
                              ))
                        ],
                      ),
                      Expanded(
                          child: prodManResponse == null
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: prodManResponse?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 16),
                                      child: SizedBox(
                                        width: 130,
                                        child: Card(
                                          elevation: 7,
                                          shadowColor: Colors.grey,
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.network(
                                                    prodManResponse?[index]
                                                            .image ??
                                                        "",
                                                    fit: BoxFit.cover),
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 4),
                                                    color: Colors.red,
                                                    child: Text(
                                                      'New',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                          margin: EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      color: Colors.white,
                                    );
                                  },
                                )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, bottom: 0),
                            child: Text(
                              'Jewelery',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          MaterialButton(
                              highlightColor: Colors.white,
                              splashColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                          data:
                                              "https://fakestoreapi.com/products/category/jewelery")),
                                );
                              },
                              child: Text("SeeAll",
                                  style: TextStyle(color: Colors.indigo)))
                        ],
                      ),
                      Expanded(
                          child: prodjResponse == null
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: prodjResponse?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 16),
                                      color: Colors.white,
                                      child: SizedBox(
                                        width: 130,
                                        child: Card(
                                          elevation: 7,
                                          shadowColor: Colors.grey,
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          margin: const EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.network(
                                                    prodjResponse?[index]
                                                            .image ??
                                                        "",
                                                    fit: BoxFit.contain),
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 4),
                                                    color: Colors.red,
                                                    child: Text(
                                                      'New',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, bottom: 0),
                            child: Text(
                              'Electronics',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MaterialButton(
                              highlightColor: Colors.white,
                              splashColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                          data:
                                              "https://fakestoreapi.com/products/category/electronics")),
                                );
                              },
                              child: Text("SeeAll",
                                  style: TextStyle(color: Colors.indigo)))
                        ],
                      ),
                      Expanded(
                          child: prodEResponse == null
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: prodEResponse?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      color: Colors.white,
                                      child: SizedBox(
                                        width: 130,
                                        child: Card(
                                          elevation: 7,
                                          shadowColor: Colors.grey,
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          margin: EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Stack(alignment: Alignment.center,children: [
                                            Image.network(
                                                prodEResponse?[index].image ??
                                                    "",
                                                fit: BoxFit.contain),
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                                color: Colors.red,
                                                child: Text(
                                                  'New',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
