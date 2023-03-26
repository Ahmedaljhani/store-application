import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../model/product_response.dart';



class ProductDetProvider extends ChangeNotifier{
  Dio? dio;
  ProductResponse? data;

  ProductDetProvider(){
    print("Products Categories provider constructor");
    //to tell what type will be work with it
    dio = Dio(
        BaseOptions(
            contentType: "Application/json"
        )
    );
  }
  Future<void> getProductDet(String path) async {
    try{
      var response = await dio?.get(path);
      print("get Products Detailes called");

      // List<dynamic> jsonList = response?.data;
      // data = jsonList.map((item) => ProductResponse().fromJson(item)).cast<ProductResponse>().toList();
   data=ProductResponse.fromJson(response?.data);

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