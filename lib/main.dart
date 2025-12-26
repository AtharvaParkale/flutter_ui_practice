import 'package:demo_app_three/features/widget_binding_observer.dart';
import 'package:flutter/material.dart';

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
      // home: BlocProvider(
      //   create: (context) => DummyBloc(
      //     getDataUseCase: GetDataUseCase(
      //       RepositoryImpl(RemoteDatasourceImpl()),
      //     ),
      //   ),
      //   // child: UsersScreen(),
      //   child: PracticeScreen(),
      // ),
      home: WidgetBindingObserverExample(),
    );
  }
}
