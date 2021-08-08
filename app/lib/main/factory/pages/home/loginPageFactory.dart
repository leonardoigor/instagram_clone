import 'package:app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

Widget makeHomePage() => new HomePage(
      presenter: makeLoginPresent(),
    );
