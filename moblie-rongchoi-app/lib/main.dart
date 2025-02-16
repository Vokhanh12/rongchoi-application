import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rongchoi_application/core/constants/corlos.dart';
import 'package:rongchoi_application/core/constants/strings.dart';
import 'package:rongchoi_application/core/routes/routes.dart';
import 'package:rongchoi_application/features/data/datasources/db/database_helper.dart';
import 'package:rongchoi_application/features/domain/entities/tranlations_entity.dart';
import 'package:rongchoi_application/injection_container.dart';
import 'package:rongchoi_application/objectbox.g.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  final dbHelper = DatabaseHelper();
  final store = await dbHelper.store;


  //final tranlations = TranlationsEntity(id: 1, code: 'RC.Username', tranlationVi: 'Tên đăng nhập', tranlationEn: 'Username');

  //await dbHelper.saveTranlationLocal(tranlations);

  print("test");

  var test = await dbHelper.getTranlationsAllLocal(1);
  print(dbHelper.getTranlationsAllLocal(1));

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nibbles',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.login,
      theme: ThemeData(
        fontFamily: AppStrings.fontFamily,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) => AppColors.lightGrey,
          ),
        ),
      
      ),
    );
  }
}
