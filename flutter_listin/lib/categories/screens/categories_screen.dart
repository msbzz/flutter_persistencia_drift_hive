import 'package:flutter/material.dart';
import 'package:flutter_listin/_core/listin_routes.dart';
import 'package:flutter_listin/categories/data/categories_box_handler.dart';
import 'package:flutter_listin/categories/model/category.dart';
import 'package:flutter_listin/categories/screens/widgets/add_category_modal.dart';
 

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesBoxHandler _categoriesBoxHandler = CategoriesBoxHandler();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() async {
    // Carrega as categorias do Hive ou qualquer fonte de dados.
    // Para testes, podemos usar categorias estáticas
    categories.add(Category(id: '1', name: 'Mercado', shortName: 'MERC'));
    categories.add(Category(id: '2', name: 'Farmácia', shortName: 'FARM'));
    categories.add(Category(id: '3', name: 'Padaria', shortName: 'PADA'));

    setState(() {});
  }

  void _addCategory(Category category) {
    setState(() {
      categories.add(category);
    });
    // Salve a nova categoria no Hive aqui, se necessário
  }

  void _deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
    });
    // Remova a categoria do Hive aqui, se necessário
  }

  @override
  void dispose() {
    _categoriesBoxHandler.closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas categorias'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, ListinRoutes.home);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddCategoryModal(onSave: _addCategory);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: categories.isEmpty
          ? const Center(child: Text('Nenhuma categoria encontrada'))
          : Padding(
            padding: const EdgeInsets.only(left:30.0,top:20.0),
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    title: Text(category.name),
                    subtitle: Text(category.shortName),
                    trailing: IconButton(
                      icon:const Icon(Icons.delete),
                      onPressed: () {
                        _deleteCategory(index);
                      },
                    ),
                  );
                },
              ),
          ),
    );
  }
}
