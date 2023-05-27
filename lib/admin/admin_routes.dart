import 'package:go_router/go_router.dart';
import 'package:qwise/admin/send_notification_admin/send_notification_from_admin.dart';

import '../router/routes_names.dart';
import 'admin_screen/admin_panel_screen.dart';

final List<RouteBase> adminRoutes = [
  GoRoute(
    path: RouteNames.adminPanel,
    name: RouteNames.adminPanel,
    builder: (context, state) {
      return const AdminPanel();
    },
  ),

  GoRoute(
    path: RouteNames.sendNotificationFromAdmin,
    name: RouteNames.sendNotificationFromAdmin,
    builder: (context, state) {
      return const SendNotificationFromAdmin();
    },
  ),

];
