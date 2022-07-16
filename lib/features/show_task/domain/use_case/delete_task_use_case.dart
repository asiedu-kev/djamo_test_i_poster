import 'package:dartz/dartz.dart';
import 'package:i_poster/core/error/failure.dart';
import 'package:i_poster/core/use_case/use_case.dart';
import 'package:i_poster/features/add_task/domain/entity/task.dart';
import 'package:i_poster/features/show_task/domain/repositiory/show_tasks_repository.dart';

class DeleteTaskUseCase implements UseCase<TaskEntity, TaskParams> {
  final ShowTaskRepository _repository;
  const DeleteTaskUseCase(this._repository);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskParams params) {
    return _repository.deleteTask(params.taskEntity!);
  }
}
