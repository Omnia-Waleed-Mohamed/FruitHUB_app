import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/data/repo/home_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepo productsRepo;

  ProductCubit(this.productsRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());

    final result = await productsRepo.getProducts();

    result.fold(
      (failure) => emit(ProductError(errorMessage: failure.errorMassage)),
      (products) => emit(ProductLoaded(products: products)),
    );
  }
}
