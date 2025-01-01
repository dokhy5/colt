import 'package:dio/dio.dart';

abstract class Failure {
   final String errMessage;
 Failure (this.errMessage);

}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
factory ServerFailure.fromDioError(DioException dioError)
{
  switch(dioError.type){
    
    case DioExceptionType.connectionTimeout:
    return ServerFailure('connection timeout with Apiserver');
    case DioExceptionType.sendTimeout:
      return ServerFailure('send timeout with Apiserver');
    case DioExceptionType.receiveTimeout:
      return ServerFailure("receive timout with Apiserver");
    case DioExceptionType.badCertificate:
      return ServerFailure('Invalid SSL certificate from the API server');
    case DioExceptionType.badResponse:
    return ServerFailure.fromresponse(dioError.response!.statusCode!, dioError.response!.data);
    case DioExceptionType.cancel:
      return ServerFailure('The request to the API server was canceled');
    case DioExceptionType.connectionError:
      return ServerFailure('Failed to connect to the API server');
    case DioExceptionType.unknown:
      if (dioError.message!.contains('SocketException') ) {
        return ServerFailure('no internet connection');
      }
      return ServerFailure('An unknown error occurred while communicating with the API server');
      default:
        return ServerFailure('Opps there was an error, please try again later');
  }

}
factory ServerFailure.fromresponse(int statusCode,dynamic response){
  if (statusCode == 401||statusCode == 401||statusCode == 400) {
    return ServerFailure(response['error']['message']);
}else if (statusCode == 404) {
  return ServerFailure('Your request was not found, please try again later');
  }
else if (statusCode == 500) {
  return ServerFailure('Internal Server Error, please try again later');
  }else{
    return ServerFailure('Opps there was an Error, please try again later');

   }
  }
} 
// class NoInternetFailure extends Failure {}
// class NoBooksFoundFailure extends Failure {}
