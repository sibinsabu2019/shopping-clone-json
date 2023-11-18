import 'package:flutter/material.dart';

class UserModel {
  dynamic? image_url;
  dynamic? size;
  String? name; 

  // Constructor with named parameters
  UserModel({required this.image_url,required this.size,required this.name});

  // Method to convert the object to a map
  // Map<String, dynamic> toMap() {
  //   return {"image": this.image};
  // }

// map to obbject 
 
  UserModel.FromMap(Map<dynamic,dynamic> map)
 { 
    this.image_url=map["image_url"];
    this.name=map["name"];
    this.size=map["size"];
 }
}