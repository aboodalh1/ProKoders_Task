import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Poor Connection, try again');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        if (dioError.message == null) {
          return ServerFailure("Server error");
        }
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('Poor connection');
        }
        return ServerFailure('Something went wrong, please try again');
      default:
        return ServerFailure('Poor connection');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 403 || statusCode == 401) {
      return ServerFailure(response['message'] ?? 'Something went wrong');
    } else if (statusCode == 404) {
      return ServerFailure(response['message']);
    } else if (statusCode == 422) {
      return ServerFailure(response['message']['code'] ??
          response['message']['email'] ??
          response['message']);
    } else if (statusCode == 405) {
      return ServerFailure(response['message'] ?? 'Something went wrong');
    } else if (statusCode == 500) {
      return ServerFailure('Server error');
    } else {
      return ServerFailure(response['message'] ?? 'Something went wrong');
    }
  }
}
