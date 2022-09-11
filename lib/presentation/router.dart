import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/category/update_arguments.dart';
import 'package:malika_shop/main.dart';
import 'package:malika_shop/presentation/admin/admin_page.dart';
import 'package:malika_shop/presentation/admin/category/categories_admin_page.dart';
import 'package:malika_shop/presentation/admin/category/category_add_page.dart';
import 'package:malika_shop/presentation/admin/category/category_update_page.dart';
import 'package:malika_shop/presentation/admin/order/orders_admin_page.dart';
import 'package:malika_shop/presentation/admin/product/products_admin_page.dart';
import 'package:malika_shop/presentation/profile/profile_page.dart';
import 'package:malika_shop/presentation/tab/tab_box.dart';
import 'package:malika_shop/utils/constants.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(builder: (_) => MainPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => TabBox());
      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case adminPage:
        return MaterialPageRoute(builder: (_) => AdminPage());
      case adminCategories:
        return MaterialPageRoute(builder: (_) => CategoriesAdminPage());
      case adminProducts:
        return MaterialPageRoute(builder: (_) => ProductsAdminPage());
      case adminOrders:
        return MaterialPageRoute(builder: (_) => OrderssAdminPage());
      case addCategory:
        return MaterialPageRoute(builder: (_) => CategoryAddPage(
          currentLength: settings.arguments as int,
        ));
      case updateCategory:
        return MaterialPageRoute(
            builder: (_) => CategoryUpdatePage(
                updateCategoryArgs: settings.arguments as UpdateCategoryArgs));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
