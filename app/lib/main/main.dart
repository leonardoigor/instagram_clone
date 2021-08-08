import 'package:app/main/routesEnum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'factory/pages/pages.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      title: 'instagram',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      getPages: [
        GetPage(
          name: Routers.login,
          page: makeLoginPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: Routers.home,
          page: makeHomePage,
          transition: Transition.fade,
        ),
      ],
    );
  }
}
