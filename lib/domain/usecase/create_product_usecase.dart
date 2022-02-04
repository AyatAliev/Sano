import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sano/domain/entity/failure.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/domain/repository/product_repository.dart';
import 'async_usecase.dart';

class CreateProductUseCase extends AsyncUseCase {
  final ProductRepository _repository;

  CreateProductUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, int>> execute({Product? product}) async {
    try {
      return Right(await _repository.createProduct(product!));
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      return Left(Failure(message: "CreateProductCodeUseCase error", exception: "$error", stackTrace: stackTrace));
    }
  }
}
