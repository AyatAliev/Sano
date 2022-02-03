import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sano/domain/entity/failure.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/domain/entity/success.dart';
import 'package:sano/domain/repository/product_repository.dart';
import 'async_usecase.dart';

class GetProductsUseCase extends AsyncUseCase {
  final ProductRepository _repository;

  GetProductsUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<Product>>> execute() async {
    try {
      return Right(await _repository.getProducts());
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      return Left(Failure(message: "GetProductsCodeUseCase error", exception: error as Exception, stackTrace: stackTrace));
    }
  }
}
