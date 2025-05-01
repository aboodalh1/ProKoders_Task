import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prokoders_login_task/core/util/failure/failure.dart';
import 'package:prokoders_login_task/core/util/network/api_service.dart';
import 'package:prokoders_login_task/features/items/data/model/pagination_model.dart';
import 'package:prokoders_login_task/features/items/data/repos/item_repository.dart';

class ItemRepositoryImplementation implements ItemRepository {
  DioHelper dioHelper;

  ItemRepositoryImplementation(this.dioHelper);

  @override
  Future<Either<Failure, String>> addItem({
    required String title,
    required String description,
  }) async {
    try {
       await dioHelper.postData(
        endPoint: 'products/add',
        data: {"title": title, "description": description},
      ); 
      return right("Added Successfully");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginationModel>> fetchItems({
    required int page,
  }) async {
    try {
      var response = await dioHelper.getData(
        endPoint: 'products?select=title,description,images',
        query: {"total": 194, "limit": 10, "skip": page * 10},
      );
      PaginationModel paginationModel = PaginationModel.fromJson(response.data);
      return right(paginationModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
