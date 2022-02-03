import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/domain/usecase/create_product_usecase.dart';
import 'package:sano/domain/usecase/delete_product_usecase.dart';
import 'package:sano/domain/usecase/get_products_usecase.dart';
import 'package:sano/presentation/screen/catalog/catalog_bloc.dart';
import 'package:sano/presentation/widget/create_product_popup.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = "catalog";

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogBloc>(
          create: (context) => CatalogBloc(
              deleteProductCodeUseCase: GetIt.I<DeleteProductCodeUseCase>(),
              createProductUseCase: GetIt.I<CreateProductUseCase>(),
              getProductsUseCase: GetIt.I<GetProductsUseCase>()),
          dispose: (context, catalogBloc) => catalogBloc.dispose(),
        ),
      ],
      child: Consumer<CatalogBloc>(
        builder: (context, catalogBloc, child) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverToBoxAdapter(
                    child: StreamBuilder<List<Product>>(
                        stream: catalogBloc.productsStream,
                        builder: (context, snapshot) {
                          if (snapshot.data == null || snapshot.data?.isEmpty == true) {
                            return const SizedBox.shrink();
                          }

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: Colors.grey,
                                  ),
                                  child: Dismissible(
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.all(14),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        color: Color(0xffF25B63),
                                      ),
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.white,
                                      ),
                                    ),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) async {
                                      catalogBloc.deleteProduct(snapshot.data![index]);
                                    },
                                    key: ValueKey(snapshot.data?[index].hashCode),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot.data![index].name,
                                                style: CupertinoTheme.of(context)
                                                    .textTheme
                                                    .textStyle
                                                    .copyWith(fontSize: 18, color: Colors.black),
                                              ),
                                              Text(
                                                _formatDate(context, snapshot.data![index].date),
                                                style: CupertinoTheme.of(context)
                                                    .textTheme
                                                    .textStyle
                                                    .copyWith(fontSize: 12, color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            (snapshot.data?[index].price.toString() ?? '') + ' Price',
                                            style: CupertinoTheme.of(context)
                                                .textTheme
                                                .textStyle
                                                .copyWith(fontSize: 18, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _createProduct(context, catalogBloc),
              tooltip: 'Create Product',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(BuildContext context, DateTime? date) {
    if (date == null) {
      return 'Нет даты';
    }
    return DateFormat("dd.MM.yyyy").format(date);
  }

  Future<void> _createProduct(BuildContext context, CatalogBloc catalogBloc) async {
    final result = await Navigator.push<CreateProductResult>(context, AddFieldPopup());

    if (result is CreateProductResult) {
      catalogBloc.createProduct(result.product);
    }
  }
}
