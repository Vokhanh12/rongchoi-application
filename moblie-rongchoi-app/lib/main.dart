import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rongchoi_application/core/constants/corlos.dart';
import 'package:rongchoi_application/core/constants/strings.dart';
import 'package:rongchoi_application/core/observer/bloc_observer.dart';
import 'package:rongchoi_application/core/routes/routes.dart';
import 'package:rongchoi_application/features/data/datasources/db/database_helper.dart';
import 'package:rongchoi_application/features/domain/entities/tranlations_entity.dart';
import 'package:rongchoi_application/features/presentation/bloc/tranlation_bloc/tranlation_bloc.dart';
import 'package:rongchoi_application/injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = RCBlocObserver();

  await initLocator();

  final dbHelper = DatabaseHelper();
  final store = await dbHelper.store;

  final tranlations_1 = TranlationsEntity(id: 1, code: 'RC.Username', tranlationVi: 'Tên đăng nhập', tranlationEn: 'Username');
  final tranlations_2 = TranlationsEntity(id: 2, code: 'RC.Password', tranlationVi: 'Mật khẩu', tranlationEn: 'Password');
  final tranlations_3 = TranlationsEntity(id: 3, code: 'RC.ForgotPassword', tranlationVi: 'Quên mật khẩu', tranlationEn: 'Forgot password?');
  final tranlations_4 = TranlationsEntity(id: 4, code: 'RC.Login', tranlationVi: 'Đăng nhập', tranlationEn: 'Login');
  await dbHelper.saveTranlationLocal(tranlations_1);
  await dbHelper.saveTranlationLocal(tranlations_2);
  await dbHelper.saveTranlationLocal(tranlations_3);
  await dbHelper.saveTranlationLocal(tranlations_4);

  print("test"); 

  var test = await dbHelper.getAllTranslationsLocal();
  print(test);

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
    return MultiBlocProvider(
      providers: [
          BlocProvider<TranlationBloc>(create: (context) => locator<TranlationBloc>()),
      ],
        child:  MaterialApp(
          title: 'Nibbles',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splash,
          theme: ThemeData(
            fontFamily: AppStrings.fontFamily,
            scaffoldBackgroundColor: AppColors.MA_SFBACKGROUP_COLOR,
          ),
        )
    );
  }
}
