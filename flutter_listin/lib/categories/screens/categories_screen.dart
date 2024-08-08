 
import 'package:flutter/material.dart';
import 'package:flutter_listin/_core/listin_routes.dart';
import 'package:flutter_listin/categories/data/categories_box_handler.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesBoxHandler _categoriesBoxHandler= CategoriesBoxHandler();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    _categoriesBoxHandler.closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(onPressed: (){
          print('Clicou para sair');
          Navigator.pushReplacementNamed(context, ListinRoutes.home);
        }, 
        icon: const Icon(Icons.arrow_back)) ,
         ),
             floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text('List Catergories'),),
    );
  }
}