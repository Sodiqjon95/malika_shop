import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/category/category_item.dart';
import 'package:malika_shop/presentation/widgets/my_custom_button.dart';
import 'package:malika_shop/presentation/widgets/universal_text_input.dart';
import 'package:malika_shop/utils/my_utils.dart';
import 'package:malika_shop/view_models/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({Key? key}) : super(key: key);

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryDescriptionController =
      TextEditingController();
  String imageUrl = "https://phoneaqua.com/og/samsung.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Category Add Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.red)),
        child: Column(
          children: [
            UniversalTextInput(
              hintText: "Category name",
              textController: categoryNameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            UniversalTextInput(
              hintText: "Description",
              textController: categoryDescriptionController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            Image.network(
              imageUrl,
              width: 200,
              height: 150,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: const Text(
                "Upload category Image",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            MyCustomButton(
              onTap: () {
                String desc = categoryDescriptionController.text;
                String name = categoryNameController.text;
                if (desc.isEmpty) {
                  MyUtils.getMyToast(message: "Enter category name");
                } else if (name.isEmpty) {
                  MyUtils.getMyToast(message: "Enter category description");
                } else if (imageUrl.isEmpty) {
                  MyUtils.getMyToast(message: "Upload category image!");
                } else {
                  context.read<CategoryViewModel>().addCategory(
                        context: context,
                        categoryItem: CategoryItem(
                          imageUrl: imageUrl,
                          createdAt: DateTime.now(),
                          categoryName: name,
                          categoryId: 3,
                          description: desc,
                        ),
                      );
                }
              },
              text: "Add category",
            )
          ],
        ),
      ),
    );
  }
}
