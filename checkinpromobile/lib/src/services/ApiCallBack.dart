import 'dart:typed_data';

import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
class ApiCallBack {
  Function _onSuccess;
  Function _onError;

  ApiCallBack(onSuccess, onError) {
    _onSuccess = onSuccess;
    _onError = onError;
  }
  void onSuccess(BaseResponse baseResponse){
    _onSuccess(baseResponse);
  }
  void onSuccessFile(Uint8List file, String type){
    _onSuccess(file, type);
  }
  void onError(Errors error){
    _onError(error);
  }

  void onSuccessList(BaseListResponse baseListResponse){
    _onSuccess(baseListResponse);
  }

}