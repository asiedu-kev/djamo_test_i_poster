import 'package:dartz/dartz.dart';
import 'package:i_poster/core/error/failure.dart';
import 'package:i_poster/core/use_case/use_case.dart';
import 'package:i_poster/features/add_task/domain/entity/task.dart';
import 'package:i_poster/features/add_task/domain/repositiory/add_task_repository.dart';

class AddTaskUseCase extends UseCase<TaskEntity, AddTaskParam> {
  final AddTaskRepository _repository;
  AddTaskUseCase(this._repository);

  @override
  Future<Either<Failure, TaskEntity>> call(AddTaskParam params) {
    return _repository.addTask(params.taskEntity!);
  }
}
