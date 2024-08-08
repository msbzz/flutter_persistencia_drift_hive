import 'package:flutter_listin/categories/model/category.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoriesBoxHandler{
  late Box _box;

  // Future<void> openBox() async{
  //   _box = await Hive.openBox();
  // }

  Future<void> closeBox() async{
     return _box.close();
  }

  Future<int>insertCategory(Category category){
    return _box.add(category);
  }

  List<Category> getCategories(){
    return _box.values.map((elemento)=>elemento as Category).toList();
  }

  Future<void> updateCategory(Category category)async {
    return category.save();
  }

  Future<void>removeCategory(Category category) async{
    return _box.delete(category.key);
  }
}