import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';

class ProductsRepo {
  final ApiService apiService;

  ProductsRepo(this.apiService);

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await apiService.getData(endPoint: "products");

      List<ProductModel> products = (response as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();

      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }
}
