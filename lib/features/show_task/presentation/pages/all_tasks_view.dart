import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_poster/features/show_task/presentation/bloc/show_tasks_bloc.dart';
import 'package:i_poster/features/show_task/presentation/widgets/task_item.dart';

import '../bloc/show_tasks_states.dart';
import '../widgets/empty_state.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<ShowTaskBloc>();
    return BlocBuilder<ShowTaskBloc, ShowTaskState>(
        builder: (BuildContext context, ShowTaskState state) {
      return homeBloc.tasks.isEmpty
          ? const EmptyState(
              imgName: 'no-tasks',
              text: 'No Tasks Yet',
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'All Tasks',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) =>
                      TaskItem(homeBloc.tasks[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    indent: 12,
                    endIndent: 12,
                  ),
                  itemCount: homeBloc.tasks.length,
                )
              ],
            );
    });
  }
}
