import 'package:demo_app_three/features/dummy_api/data/datasources/remote_datasource.dart';
import 'package:demo_app_three/features/dummy_api/data/repositories/repository_impl.dart';
import 'package:demo_app_three/features/dummy_api/domain/usecase/get_data_usecase.dart';
import 'package:demo_app_three/features/dummy_api/presentation/bloc/dummy_bloc.dart';
import 'package:demo_app_three/features/dummy_api/presentation/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => DummyBloc(
          getDataUseCase: GetDataUseCase(
            RepositoryImpl(RemoteDatasourceImpl()),
          ),
        ),
        child: UsersScreen(),
      ),
    );
  }
}
