import 'package:go_router/go_router.dart';
import 'package:pharmacy/screens/cart.dart';
import 'package:pharmacy/screens/home/home_screen.dart';
import 'package:pharmacy/screens/product_info.dart';

class AppRouter {

  late final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/pharmacy',
      routes: [
        GoRoute(
          name: 'pharmacy',
          path: '/pharmacy',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'productInfo',
          path: '/productInfo',
          builder: (context, state) => const ProductInfo(),
        ),

        GoRoute(
          name: 'cart',
          path: '/cart',
          builder: (context, state) => const Cart(),
        ),
      ]);
}