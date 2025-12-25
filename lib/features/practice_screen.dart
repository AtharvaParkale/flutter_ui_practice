import 'package:demo_app_three/features/app_bottom_sheet.dart';
import 'package:demo_app_three/features/dummy_api/data/datasources/remote_datasource.dart';
import 'package:demo_app_three/features/dummy_api/data/repositories/repository_impl.dart';
import 'package:demo_app_three/features/dummy_api/domain/usecase/get_data_usecase.dart';
import 'package:demo_app_three/features/dummy_api/presentation/bloc/dummy_bloc.dart';
import 'package:demo_app_three/features/dummy_api/presentation/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AppBottomSheet();
                  },
                );
              },
              child: Container(
                color: Colors.black,
                child: Text("Click", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => BlocProvider(
                      create: (context) => DummyBloc(
                        getDataUseCase: GetDataUseCase(
                          RepositoryImpl(RemoteDatasourceImpl()),
                        ),
                      ),
                      // child: UsersScreen(),
                      child: UsersScreen(),
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.black,
                child: Text("Navigate", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
