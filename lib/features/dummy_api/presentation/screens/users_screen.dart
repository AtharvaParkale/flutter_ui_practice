import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/presentation/bloc/dummy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    context.read<DummyBloc>().add(GetAllPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DummyBloc, DummyState>(
        listener: (context, state) {
          if (state is SuccessState) {
            users = state.users;
          }
        },
        buildWhen: (prev, curr) =>
            curr is LoadingState || curr is SuccessState || curr is ErrorState,
        builder: (context, state) {
          if (state is LoadingState) {
            return Text("Loading");
          } else if (state is SuccessState) {
            return Scaffold(
              body: ListView(
                children: users.map((user) => Text(user.body)).toList(),
              ),
            );
          } else if (state is ErrorState) {
            return Text("Error");
          }
          return Text("Nothing");
        },
      ),
    );
  }
}
