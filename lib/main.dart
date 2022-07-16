import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_poster/core/themes/theme_manager.dart';
import 'package:i_poster/dependency_container.dart';
import 'package:i_poster/features/show_task/presentation/bloc/show_tasks_bloc.dart';

import 'dependency_container.dart';
import 'features/show_task/presentation/pages/show_tasks_view.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ShowTaskBloc(sl(), sl(), sl())..getAllTasks())
      ],
      child: DynamicTheme(
          builder: (BuildContext context, ThemeData theme) => MaterialApp(
                title: 'IPoster',
                theme: theme,
                debugShowCheckedModeBanner: false,
                home: const ShowTasksView(),
              ),
          themeCollection: ThemeCollection(themes: {
            1: ThemeManager.theme,
            0: ThemeManager.darkTheme,
          })),
    );
  }
}
