import 'package:flutter/material.dart';
import 'package:pharmacy/data/repositories_implementation/cart_repository_implementation.dart';
import 'package:pharmacy/data/repositories_implementation/product_repository_implementation.dart';
import 'package:pharmacy/navigation/app_router.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final router = _appRouter.router;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductRepositoryImplementation>(
            lazy: false,
            create: (_) => ProductRepositoryImplementation()),
        ChangeNotifierProvider<CartRepositoryImplementation>(
            lazy: false,
            create: (_) => CartRepositoryImplementation()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Proxima-Nova',
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
