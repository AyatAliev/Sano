import 'package:dartz/dartz.dart';
import 'package:sano/domain/entity/failure.dart';

abstract class AsyncUseCase<T> {
  Future<Either<Failure, T>> execute();
}
