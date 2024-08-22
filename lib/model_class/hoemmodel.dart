import 'package:flutter/foundation.dart';

class HomeModel{
  final String location;
  final List<String> images;

  HomeModel({required this.location, required this.images});

  factory HomeModel.fromjson(Map<String, dynamic> tojson){
    return HomeModel(location: tojson['location'], images: tojson['images']);
  }

}
