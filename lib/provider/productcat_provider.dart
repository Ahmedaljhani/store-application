import 'package:dio/dio.dart';
import 'package:first_class/model/product_response.dart';
import 'package:flutter/cupertino.dart';

import '../model/post_response.dart';



class ProductCatProvider extends ChangeNotifier{
  Dio? dio;
  List<ProductResponse>? data;

  ProductCatProvider(){
    print("Products Categories provider constructor");
    //to tell what type will be work with it
    dio = Dio(
        BaseOptions(
            contentType: "Application/json"
        )
    );
  }
  Future<void> getProductCat(String path) async {
    try{
      var response = await dio?.get(path);
      print("get Products Categoreis called");

      List<dynamic> jsonList = response?.data;
      data = jsonList.map((item) => ProductResponse.fromJson(item)).cast<ProductResponse>().toList();

    }catch(error){
      print("error: $error");

    }
//PostResponse.fromJson(response?.data);
    notifyListeners();
  }
  void refresh (){
    data=null;
    notifyListeners();
  }


}