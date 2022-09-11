import 'package:flutter/material.dart';
import 'package:malika_shop/main.dart';
import 'package:malika_shop/presentation/admin/admin_page.dart';
import 'package:malika_shop/presentation/admin/categories_admin_page.dart';
import 'package:malika_shop/presentation/admin/orders_admin_page.dart';
import 'package:malika_shop/presentation/admin/products_admin_page.dart';
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
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
