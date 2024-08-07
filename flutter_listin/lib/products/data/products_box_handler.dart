import 'package:hive_flutter/hive_flutter.dart';

class ProductsBoxHandler{
  late Box _box;

  Future<void> openBox(String ListinId) async{
    _box = await Hive.openBox(ListinId);
  }

  Future<void> closeBox() async{
     return _box.close();
  }
}