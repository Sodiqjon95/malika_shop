import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/category/category_item.dart';
import 'package:malika_shop/data/models/category/update_arguments.dart';
import 'package:malika_shop/presentation/admin/category/widgets/category_item_admin.dart';
import 'package:malika_shop/utils/constants.dart';
import 'package:malika_shop/view_models/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoriesAdminPage extends StatefulWidget {
  const CategoriesAdminPage({Key? key}) : super(key: key);

  @override
  State<CategoriesAdminPage> createState() => _CategoriesAdminPageState();
}

class _CategoriesAdminPageState extends State<CategoriesAdminPage> {
  int currentLength = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, addCategory,
                arguments: currentLength),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        stream: context.read<CategoryViewModel>().getCategoriesForAdmin(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final docs = snapshot.data!;
            currentLength = docs.length;
            return currentLength > 0
                ? ListView(
                    children: docs.map((doc) {
                      CategoryItem categoryItem =
                          CategoryItem.fromJson(doc.data());
                      return CategoryItemAdmin(
                        onDeleteTap: () {
                          context.read<CategoryViewModel>().deleteCategory(
                                context: context,
                                docId: doc.id,
                              );
                        },
                        categoryItem: categoryItem,
                        onUpdateTap: () => Navigator.pushNamed(
                          context,
                          updateCategory,
                          arguments: UpdateCategoryArgs(
                            categoryItem: categoryItem,
                            docId: doc.id,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : const Center(
                    child: Text("List Empty"),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
