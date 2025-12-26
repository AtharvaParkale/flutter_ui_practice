import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/task.dart';
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
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    // context.read<DummyBloc>().add(GetAllPostsEvent());
    context.read<DummyBloc>().add(GetAllTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop("Atharva");
            },
            child: Text("Back"),
          ),
        ],
      ),
      body: BlocConsumer<DummyBloc, DummyState>(
        listener: (context, state) {
          // if (state is SuccessState) {
          //   users = state.users;
          // }
          if (state is TasksSuccessState) {
            tasks = state.tasks;

            // final newTask = state.tasks.where((task) {
            //   return task.title.contains("A");
            // }).toList();
            // tasks = newTask;
          }
        },
        buildWhen: (prev, curr) =>
            curr is LoadingState ||
            curr is SuccessState ||
            curr is ErrorState ||
            curr is TasksSuccessState,
        builder: (context, state) {
          if (state is LoadingState) {
            return Text("Loading");
          } else if (state is SuccessState) {
            return Scaffold(
              body: ListView(
                children: users.map((user) => Text(user.body)).toList(),
              ),
            );
          } else if (state is TasksSuccessState) {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpansionTile(
                  title: Text(tasks[index].title),
                  children: tasks[index].subTasks
                      .map((subTask) => Text(subTask.description))
                      .toList(),
                );
              },
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
