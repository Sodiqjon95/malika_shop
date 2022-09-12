import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/category/category_item.dart';
import 'package:malika_shop/data/models/products/product_item.dart';
import 'package:malika_shop/presentation/widgets/my_custom_button.dart';
import 'package:malika_shop/presentation/widgets/universal_text_input.dart';
import 'package:malika_shop/utils/my_utils.dart';
import 'package:malika_shop/view_models/category_view_model.dart';
import 'package:malika_shop/view_models/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryDescriptionController =
      TextEditingController();
  String imageUrl = "https://phoneaqua.com/og/samsung.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Product Add Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.red)),
        child: Column(
          children: [
            UniversalTextInput(
              hintText: "Product name",
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
                  context.read<ProductViewModel>().addProduct(
                      context: context,
                      productItem: ProductItem(
                        currency: "SO'M",
                        createdAt: DateTime.now(),
                        count: 10,
                        categoryId: "categoryId",
                        description: desc,
                        productId: "",
                        price: 1200.0,
                        productImages: [imageUrl],
                        productName: name,
                      ));
                  Navigator.pop(context);
                }
              },
              text: "Add Product",
            )
          ],
        ),
      ),
    );
  }
}
