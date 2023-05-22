import 'package:go_router/go_router.dart';
import 'package:qwise/admin/admin_panel.dart';

import '../router/routes_names.dart';

final List<RouteBase> adminRoutes = [
  GoRoute(
    path: RouteNames.adminPanel,
    name: RouteNames.adminPanel,
    builder: (context, state) {
      return const AdminPanel();
    },
  ),
];
