import 'package:flutter/material.dart';
import 'package:multiselect_formfield/di_container.dart';
import 'my_app.dart';

void main() async{
  await diContainer.init();
  runApp(const MyApp());
}



