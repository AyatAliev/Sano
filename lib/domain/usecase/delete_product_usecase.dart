import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sano/domain/entity/failure.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/domain/entity/success.dart';
import 'package:sano/domain/repository/product_repository.dart';
import 'async_usecase.dart';

class DeleteProductCodeUseCase extends AsyncUseCase {
  final ProductRepository _repository;

  DeleteProductCodeUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, int>> execute({Product? product}) async {
    try {
      return Right(await _repository.deleteProduct(product!));
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      return Left(Failure(message: "DeleteProductCodeUseCase error", exception: error as Exception, stackTrace: stackTrace));
    }
  }
}
