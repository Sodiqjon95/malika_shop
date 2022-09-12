import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/products/product_item.dart';
import 'package:malika_shop/presentation/admin/product/widgets/product_item_admin.dart';
import 'package:malika_shop/utils/constants.dart';
import 'package:malika_shop/view_models/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductsAdminPage extends StatelessWidget {
  const ProductsAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, addProduct),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: StreamBuilder<List<ProductItem>>(
        stream: context.read<ProductViewModel>().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return products.isNotEmpty
                ? ListView(
                    children: List.generate(
                      products.length,
                      (index) => ProductItemAdmin(
                          onDeleteTap: () {
                            // context.read<ProductViewModel>().deleteCategory(
                            //       context: context,
                            //       docId: categories[index].categoryId,
                            //     );
                          },
                          productItem: products[index],
                          onUpdateTap: () {
                            // => Navigator.pushNamed(
                            //   context,
                            //   updateCategory,
                            //   arguments: UpdateCategoryArgs(
                            //     categoryItem: categories[index],
                            //     docId: categories[index].categoryId,
                            //   ),
                            // ),
                          }),
                    ),
                  )
                : const Center(
                    child: Text("List Empty"),
                  );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
