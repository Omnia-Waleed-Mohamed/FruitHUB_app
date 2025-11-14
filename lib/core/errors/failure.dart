
import 'package:dio/dio.dart';


class Failure {
  final String errorMassage;

  Failure({required this.errorMassage});
}

class FirebaseError extends Failure {
 FirebaseError({required String errorMassage})
      : super(errorMassage: errorMassage);
}




class ServerFailure extends Failure {
  ServerFailure({required super.errorMassage});
  factory ServerFailure.fromDioException(DioException dioException){


    switch(dioException.type)
    {

      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMassage: 'Connction time outTime with api');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMassage:'Send messege fail with api');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMassage:'Receive messege fail with api');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMassage:'Bad certificate received');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode !,
            dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMassage:'the reust was cancelled ,please try again!');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMassage:'the internet connection fail,please try again!');
      case DioExceptionType.unknown:
        return ServerFailure(errorMassage:'Unexpected error ,please try again!');
      default:
        return ServerFailure(errorMassage:'Oops ther was an error ,please try again!');
    }
  }
  factory ServerFailure.fromResponse(int satatusCode,Map<String,dynamic> responsData)
  {
    if(satatusCode==400||satatusCode==401||satatusCode==403)
    {
      return ServerFailure(errorMassage:responsData['error']['message']);
    }else if(satatusCode==404)
    {
      return ServerFailure(errorMassage:'You requst not found,please try later!');
    }else if(satatusCode==500)
    {
      return ServerFailure(errorMassage:'the Server has an error ,please try later!');
    }
    else {
      return ServerFailure(errorMassage:'Unexpected error ,please try again!');
    }
  }


  

}
