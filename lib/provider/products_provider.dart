import 'package:dio/dio.dart';
import 'package:first_class/model/product_response.dart';
import 'package:flutter/cupertino.dart';

import '../model/post_response.dart';



class ProductsProvider extends ChangeNotifier{
  Dio? dio;
  List<ProductResponse>? data;

  ProductsProvider(){
    print("Products provider constructor");
    //to tell what type will be work whith it
    dio = Dio(
        BaseOptions(
            contentType: "Application/json"
        )
    );
  }
  Future<void> getProduct() async {
    try{
      var response = await dio?.get("https://fakestoreapi.com/products");
      print("get Products called");

      List<dynamic> jsonList = response?.data;
      data = jsonList.map((item) => ProductResponse.fromJson(item)).cast<ProductResponse>().toList();

    }catch(error){
      print("error: $error");

    }
//PostResponse.fromJson(response?.data);
    notifyListeners();
  }


}