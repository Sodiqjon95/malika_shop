import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:malika_shop/presentation/auth/auth_page.dart';
import 'package:malika_shop/presentation/router.dart';
import 'package:malika_shop/presentation/tab/tab_box.dart';
import 'package:malika_shop/utils/constants.dart';
import 'package:malika_shop/view_models/auth_view_model.dart';
import 'package:malika_shop/view_models/category_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthViewModel>(
          create: (_) => AuthViewModel(auth: FirebaseAuth.instance),
        ),
        Provider<CategoryViewModel>(
          create: (_) =>
              CategoryViewModel(fireStore: FirebaseFirestore.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthViewModel>().authState(),
          initialData: null,
        ),
        StreamProvider(
          create: (context) => context.read<AuthViewModel>().userInfoChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: mainPage,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return TabBox();
    }
    return const AuthPage();
  }
}
