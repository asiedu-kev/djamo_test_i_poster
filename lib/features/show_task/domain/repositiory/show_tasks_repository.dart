
import 'package:dartz/dartz.dart';
import 'package:i_poster/core/error/failure.dart';
import 'package:i_poster/features/add_task/domain/entity/task.dart';

abstract class ShowTaskRepository {
  Future<Either<Failure,List<TaskEntity>>> getAllTasks();

  Future<Either<Failure,TaskEntity>> deleteTask(TaskEntity task);

  Future<Either<Failure,TaskEntity>> updateTask(TaskEntity task);
}