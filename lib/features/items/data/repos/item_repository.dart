import 'package:dartz/dartz.dart';
import 'package:prokoders_login_task/core/util/failure/failure.dart';
import 'package:prokoders_login_task/features/items/data/model/pagination_model.dart';


abstract class ItemRepository{
  Future<Either<Failure,PaginationModel>> fetchItems({required int page});
  Future<Either<Failure,String>> addItem({required String title,required String description});

}