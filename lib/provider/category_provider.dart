import 'package:dio/dio.dart';
import 'package:first_class/model/post_response.dart';
import 'package:flutter/material.dart';


class CategoryProvider extends ChangeNotifier{

  Dio? dio;
  List<String>? data;
  bool isLoading = true;

  CategoryProvider(){
    print("posts provider constructor");
    //to tell what type will be work whith it
    dio = Dio(
      BaseOptions(
        contentType: "Application/json"
      )
    );
  }

  Future<void> getCategories() async {
    print("get posts called");
    var response = await dio?.get("https://fakestoreapi.com/products/categories");

    List<dynamic> jsonList = response?.data;

    data = jsonList.map((item) => item.toString() ).toList();
    //PostResponse.fromJson(response?.data);
    notifyListeners();
  }

}