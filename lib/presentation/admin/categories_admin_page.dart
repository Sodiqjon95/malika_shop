import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/cateogory/category_item.dart';
import 'package:malika_shop/view_models/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoriesAdminPage extends StatefulWidget {
  const CategoriesAdminPage({Key? key}) : super(key: key);

  @override
  State<CategoriesAdminPage> createState() => _CategoriesAdminPageState();
}

class _CategoriesAdminPageState extends State<CategoriesAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CategoryViewModel>().addCategory(
                      context: context,
                      categoryItem: CategoryItem(
                        imageUrl: "https://phoneaqua.com/og/samsung.jpg",
                        createdAt: DateTime.now(),
                        categoryName: "Kompyuterlar1 ",
                        categoryId: 3,
                        description: "Kompyuterlar olami ",
                      ),
                    );
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
