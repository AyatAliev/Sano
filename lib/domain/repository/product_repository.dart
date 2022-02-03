
import 'package:sano/domain/entity/product.dart';

abstract class ProductRepository {

  Future<List<Product>> getProducts();

  Future<int> createProduct(Product product);

  Future<int> deleteProduct(Product product);
}