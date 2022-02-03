import 'package:get_it/get_it.dart';
import 'package:sano/data/datasource/impl/product_data_source_impl.dart';
import 'package:sano/data/datasource/product_data_source.dart';
import 'package:sano/data/repository/product_repository_impl.dart';
import 'package:sano/domain/repository/product_repository.dart';
import 'package:sano/domain/usecase/create_product_usecase.dart';
import 'package:sano/domain/usecase/delete_product_usecase.dart';
import 'package:sano/domain/usecase/get_products_usecase.dart';

import 'data/database/database.dart';

Future<void> di() async {
  await database();
  await catalog();
}

Future<void> catalog() async {
  /// repository
  GetIt.I.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(dataSource: GetIt.I<ProductDataSource>()),
  );

  /// use case
  GetIt.I.registerSingleton<CreateProductUseCase>(
    CreateProductUseCase(
      repository: GetIt.I<ProductRepository>(),
    ),
  );

  GetIt.I.registerSingleton<DeleteProductCodeUseCase>(
    DeleteProductCodeUseCase(
      repository: GetIt.I<ProductRepository>(),
    ),
  );

  GetIt.I.registerSingleton<GetProductsUseCase>(
    GetProductsUseCase(
      repository: GetIt.I<ProductRepository>(),
    ),
  );
}

Future<void> database() async {
  /// database init
  GetIt.I.registerSingleton<ApplicationDatabase>(
    ApplicationDatabase(),
  );

  /// data source
  GetIt.I.registerSingleton<ProductDataSource>(
    ProductDataSourceImpl(
      database: GetIt.I<ApplicationDatabase>(),
    ),
  );
}
