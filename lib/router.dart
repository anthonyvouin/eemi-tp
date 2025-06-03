import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/create_product.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => CreateProductScreen(),
    ),
  ],
);
