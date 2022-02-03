import 'package:rxdart/rxdart.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/domain/usecase/create_product_usecase.dart';
import 'package:sano/domain/usecase/delete_product_usecase.dart';
import 'package:sano/domain/usecase/get_products_usecase.dart';

class CatalogBloc {

  // UseCase
  final CreateProductUseCase _createProductCodeUseCase;
  final DeleteProductCodeUseCase _deleteProductCodeUseCase;
  final GetProductsUseCase _getProductsCodeUseCase;

  // BehaviorSubject
  final BehaviorSubject<List<Product>> _productsSubject;

  CatalogBloc({
    required CreateProductUseCase createProductUseCase,
    required DeleteProductCodeUseCase deleteProductCodeUseCase,
    required GetProductsUseCase getProductsUseCase,
  })  : _createProductCodeUseCase = createProductUseCase,
        _deleteProductCodeUseCase = deleteProductCodeUseCase,
        _getProductsCodeUseCase = getProductsUseCase,
        _productsSubject = BehaviorSubject() {
    getProducts();
  }

  Stream<List<Product>> get productsStream => _productsSubject.stream;

  void createProduct(Product product) async {
    (await _createProductCodeUseCase.execute(product: product)).fold((l) {}, (r) {
      getProducts();
    });
  }

  Future<void> getProducts() async {
    (await _getProductsCodeUseCase.execute()).fold((left) {}, (right) {
      _productsSubject.value = right;
    });
  }

  void deleteProduct(Product product) async {
    (await _deleteProductCodeUseCase.execute(product: product)).fold((left) {}, (right) {
      getProducts();
    });
  }

  void dispose() {
    _productsSubject.close();
  }
}
