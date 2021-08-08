import 'package:app/ui/pages/login/loginPage.dart';
import 'package:flutter/material.dart';

import 'loginPresenterFactory.dart';

Widget makeLoginPage() => LoginPage(
      presenter: makeLoginPresent(),
    );
