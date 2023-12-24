import 'package:empay_test/state/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/task_list/task_list_screen.dart';
import 'config/themes.dart';
import 'domain/task/repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepository()..init(),
      child: BlocProvider(
        create: (context) => TaskBloc(repository: context.read<TaskRepository>()),
        child: MaterialApp(
          title: 'ToDo List',
          theme: lightTheme,
          darkTheme: darkTheme,
          supportedLocales: const [
            Locale('en'), // only English
          ],
          home: const TaskListScreen(),
        ),
      ),
    );
  }
}