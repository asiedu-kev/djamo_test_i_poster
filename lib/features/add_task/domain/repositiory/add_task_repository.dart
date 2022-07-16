import 'package:dartz/dartz.dart';
import 'package:i_poster/core/error/failure.dart';
import 'package:i_poster/features/add_task/domain/entity/task.dart';

abstract class AddTaskRepository {
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task);
}
