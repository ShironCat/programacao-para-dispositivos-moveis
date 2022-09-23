import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:task_list/view/android/app.dart';
import 'package:task_list/view/ios/app.dart';

void main() {
  runApp(Platform.isIOS ? const IosApp() : const AndroidApp());
}
