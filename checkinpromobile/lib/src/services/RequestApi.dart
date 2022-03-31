import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/DeviceInfo.dart';
import 'package:checkinpromobile/src/model/ETNewOrder.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/EventCheckInSync.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/model/VisitorCheckIn.dart';
import 'package:checkinpromobile/src/model/VisitorInviteCheckinSync.dart';
import 'package:checkinpromobile/src/services/ApiService.dart';
import 'package:checkinpromobile/src/services/ApiServiceStorage.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiCallBack.dart';
import 'MobileDataInterceptor.dart';
import 'ServiceLocator.dart';
import 'package:intl/intl.dart';

enum ApiServicePut {
  PUT_API,
}

enum ApiServiceDelete {
  DELETE_API,
}

enum ApiServicePost { POST_API, POST_API_NO_AUTHENTICATE, PUT_API }

enum ApiServiceUpload { POST_FILE_ID, POST_FILE_JSON, POST_AVATAR }

enum ApiServiceGet {
  GET_API_WITHOUT_TOKEN,
  GET_API_WITH_PATH,
}

enum ResponseType {
  OBJECT,
  LIST,
  FILE,
}

class ApiRequest {
  static final ApiRequest _singleton = ApiRequest._internal();
  CancelableOperation cancelableRefresh;
  CancelableOperation cancelableLogout;

  factory ApiRequest() {
    return _singleton;
  }

  static const listNoneInternet = [
    // Constants.PATH_REFRESH_TOKEN,
    // Constants.PATH_SIGN_OUT,
    Constants.PATH_AUTHENTICATE,
    Constants.PATH_CHECK_DOMAIN_REGISTER,
    Constants.PATH_VALIDATE_EMAIL,
    Constants.PATH_VALIDATE_PASS_CODE,
    Constants.PATH_CHANGE_PASSWORD,
    Constants.PATH_FORGOT_PASSWORD,
  ];

  ApiRequest._internal();

  Future<CancelableOperation<dynamic>> createPutService(
      BuildContext context,
      ApiServicePut apiServiceType,
      ResponseType responseType,
      String path,
      Map<String, dynamic> body,
      ApiCallBack apiCallBack,
      Function doAgain) async {
    var token = "";
    if (apiServiceType == ApiServicePut.PUT_API) {
      token = await locator<Utilities>().getToken();
    }
    Future<dynamic> apiService;
    switch (apiServiceType) {
      case ApiServicePut.PUT_API:
        apiService = ApiService.create().putAPI(path, token, body);
        break;
    }
    var cancelable = CancelableOperation.fromFuture(
      apiService,
      onCancel: () => {},
    );
    return cancelable
      ..value.then((dynamic response) async {
        await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
      }, onError: (response) async {
        if (response is MobileException) {
          if (!listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            // var errors = Errors(
            //     -2,
            //     AppLocalizations.of(context).messageCommonError,
            //     DialogType.ERROR);
            // apiCallBack.onError(errors);
            Utilities().showPopupErrorNoInternet(context, apiCallBack, doAgain);
          }
        } else {
          await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
        }
      }).catchError((error, stackTrace) {
        try {
          var message = error.toString();
          if (message.contains("MobileException") && !listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            handlerError(context, apiCallBack, message);
          }
        } catch (e) {
          locator<Utilities>().printLog(e.toString());
          var errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
          apiCallBack.onError(errors);
        }
      });
  }

  Future<CancelableOperation<dynamic>> createPostService(
      BuildContext context,
      ApiServicePost apiServiceType,
      ResponseType responseType,
      String path,
      Map<String, dynamic> body,
      ApiCallBack apiCallBack,
      Function doAgain) async {
    var token = "";
    if (apiServiceType != ApiServicePost.POST_API_NO_AUTHENTICATE) {
      token = await locator<Utilities>().getToken();
    }
//    Utilities().printLog(
//        'Class RequestApi === Function createPostService === Path: $path === Param body: ${json.encode(body)}',
//        isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
    Future<dynamic> apiService;
    switch (apiServiceType) {
      case ApiServicePost.POST_API:
        {
          apiService = ApiService.create().postApi(path, token, body);
          break;
        }
      case ApiServicePost.POST_API_NO_AUTHENTICATE:
        {
          apiService = ApiService.create().postApiNoAuthenticate(path, body);
          break;
        }
      case ApiServicePost.PUT_API:
        {
          apiService = ApiService.create().putAPI(path, token, body);
          break;
        }
    }
    var cancelable = CancelableOperation.fromFuture(
      apiService,
      onCancel: () => {},
    );
    return cancelable
      ..value.then((dynamic response) async {
        await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
      }, onError: (response) async {
        if (response is MobileException) {
          if (!listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            // var errors = Errors(
            //     -2,
            //     AppLocalizations.of(context).messageCommonError,
            //     DialogType.ERROR);
            // apiCallBack.onError(errors);
            Utilities().showPopupErrorNoInternet(context, apiCallBack, doAgain);
          }
        } else {
          await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
        }
      }).catchError((error, stackTrace) {
        try {
          var message = error.toString();
          if (message.contains("MobileException") && !listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            handlerError(context, apiCallBack, message);
          }
        } catch (e) {
          var errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
          apiCallBack.onError(errors);
        }
      });
  }

  Future<CancelableOperation<dynamic>> createDeleteService(BuildContext context, ApiServiceDelete apiServiceType,
      ResponseType responseType, String path, ApiCallBack apiCallBack, Function doAgain) async {
    var token = "";
    if (apiServiceType == ApiServiceDelete.DELETE_API) {
      token = await locator<Utilities>().getToken();
    }
    Future<dynamic> apiService;
    switch (apiServiceType) {
      case ApiServiceDelete.DELETE_API:
        apiService = ApiService.create().deleteAPI(path, token);
        break;
    }
    var cancelable = CancelableOperation.fromFuture(
      apiService,
      onCancel: () => {},
    );
    return cancelable
      ..value.then((dynamic response) async {
        await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
      }, onError: (response) async {
        if (response is MobileException) {
          if (!listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            // var errors = Errors(
            //     -2,
            //     AppLocalizations.of(context).messageCommonError,
            //     DialogType.ERROR);
            // apiCallBack.onError(errors);
            Utilities().showPopupErrorNoInternet(context, apiCallBack, doAgain);
          }
        } else {
          await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
        }
      }).catchError((error, stackTrace) {
        try {
          var message = error.toString();
          if (message.contains("MobileException") && !listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            handlerError(context, apiCallBack, message);
          }
        } catch (e) {
          locator<Utilities>().printLog(e.toString());
          var errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
          apiCallBack.onError(errors);
        }
      });
  }

  Future<CancelableOperation<dynamic>> createUploadService(
      BuildContext context,
      ApiServiceUpload apiServiceType,
      ResponseType responseType,
      String path,
      double visitorLogId,
      String jsonString,
      MultipartFile file,
      ApiCallBack apiCallBack,
      Function doAgain) async {
    var token = await locator<Utilities>().getToken();

    Future<dynamic> apiService;
    switch (apiServiceType) {
      case ApiServiceUpload.POST_AVATAR:
        {
          apiService = ApiService.create().postApiUploadAvatar(path, token, file);
          break;
        }
      case ApiServiceUpload.POST_FILE_ID:
        {
          apiService = ApiService.create().postApiUploadFace(path, token, visitorLogId, file);
          break;
        }
      case ApiServiceUpload.POST_FILE_JSON:
        {
          apiService = ApiService.create().postApiSync(path, token, jsonString, file);
          break;
        }
    }
    var cancelable = CancelableOperation.fromFuture(
      apiService,
      onCancel: () => {},
    );
    return cancelable
      ..value.then((dynamic response) async {
        await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
      }, onError: (response) async {
        if (response is MobileException) {
          if (!listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            // var errors = Errors(
            //     -2,
            //     AppLocalizations.of(context).messageCommonError,
            //     DialogType.ERROR);
            // apiCallBack.onError(errors);
            Utilities().showPopupErrorNoInternet(context, apiCallBack, doAgain);
          }
        } else {
          await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
        }
      }).catchError((error, stackTrace) {
        try {
          var message = error.toString();
          if (message.contains("MobileException") && !listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            handlerError(context, apiCallBack, message);
          }
        } catch (e) {
          locator<Utilities>().printLog(e.toString());
          var errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
          apiCallBack.onError(errors);
        }
      });
  }

  Future<CancelableOperation<dynamic>> createGetService(BuildContext context, ApiServiceGet apiServiceType,
      ResponseType responseType, String path, ApiCallBack apiCallBack, Function doAgain) async {
//    Utilities().printLog(
//        'Class RequestApi === Function createGetService === Path: $path',
//        isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
    var token = "";
    if (apiServiceType != ApiServiceGet.GET_API_WITHOUT_TOKEN) {
      token = await locator<Utilities>().getToken();
    }
    Future<dynamic> apiService;
    switch (apiServiceType) {
      case ApiServiceGet.GET_API_WITHOUT_TOKEN:
        {
          apiService = ApiService.create().getAPIWithoutToken(path);
          break;
        }
      case ApiServiceGet.GET_API_WITH_PATH:
        {
          apiService = ApiService.create().getAPIWithPath(path, token);
          break;
        }
    }
    var cancelable = CancelableOperation.fromFuture(
      apiService,
      onCancel: () => {},
    );
    return cancelable
      ..value.then((dynamic response) async {
        await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
      }, onError: (response) async {
        if (response is MobileException) {
          if (!listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            // var errors = Errors(
            //     -2,
            //     AppLocalizations.of(context).messageCommonError,
            //     DialogType.ERROR);
            // apiCallBack.onError(errors);
            Utilities().showPopupErrorNoInternet(context, apiCallBack, doAgain);
          }
        } else {
          await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
        }
      }).catchError((error, stackTrace) {
        try {
          var message = error.toString();
          if (message.contains("MobileException") && !listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            handlerError(context, apiCallBack, message);
          }
        } catch (e) {
          locator<Utilities>().printLog(e.toString());
          var errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
          apiCallBack.onError(errors);
        }
      });
  }

  Future<CancelableOperation<dynamic>> createGetFile(
      BuildContext context, ResponseType responseType, String path, ApiCallBack apiCallBack, Function doAgain) async {
    Future<dynamic> apiService = ApiServiceStorage.create().getImage(path);
    var cancelable = CancelableOperation.fromFuture(
      apiService,
      onCancel: () => {},
    );
    return cancelable
      ..value.then((dynamic response) async {
        await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
      }, onError: (response) async {
        if (response is MobileException) {
          if (!listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            // var errors = Errors(
            //     -2,
            //     AppLocalizations.of(context).messageCommonError,
            //     DialogType.ERROR);
            // apiCallBack.onError(errors);
            Utilities().showPopupErrorNoInternet(context, apiCallBack, doAgain);
          }
        } else {
          await handlerDoneApi(response, context, apiCallBack, responseType, doAgain);
        }
      }).catchError((error, stackTrace) {
        try {
          var message = error.toString();
          if (message.contains("MobileException") && !listNoneInternet.contains(path)) {
            showNoInternet(context, apiCallBack, doAgain);
          } else {
            handlerError(context, apiCallBack, message);
          }
        } catch (e) {
          locator<Utilities>().printLog(e.toString());
          var errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
          apiCallBack.onError(errors);
        }
      });
  }

  void showNoInternet(BuildContext context, ApiCallBack apiCallBack, Function doAgain) {
    // Utilities().doAgainsInternet.add(doAgain);
    // if (Utilities().doAgainsInternet.length <= 1) {
    //   locator<Utilities>().showOneButtonDialog(
    //       context,
    //       DialogType.ERROR,
    //       null,
    //       AppLocalizations.of(context).titleError,
    //       AppLocalizations.of(context).noInternet,
    //       AppLocalizations.of(context).buttonTryAgain, () {
    //     Utilities().doAgainsInternet.forEach((item) {
    //       item();
    //     });
    //     Utilities().doAgainsInternet.clear();
    //   });
    // }
    var errors = Errors(Constants.STATUS_CODE_NO_INTERNET, AppLocalizations.of(context).noInternet, DialogType.ERROR);
    apiCallBack.onError(errors);
  }

  List<Function> doAgainhandlerDoneApiLst = List();

  void callFunctionDoneApi() {
    for (var item in doAgainhandlerDoneApiLst) {
      item();
    }
    locator<Utilities>().printLog("Class RequestApi === Func callFunctionDoneApi === doAgainDoneApis clear",
        isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
    doAgainhandlerDoneApiLst.clear();
  }

  Future handlerDoneApi(
      response, BuildContext context, ApiCallBack apiCallBack, ResponseType responseType, Function doAgain) async {
    catchSocketException(response);
    if (response is Response) {
      if (!handlerCompleteFuture(context, apiCallBack, response, responseType)) {
        doAgainhandlerDoneApiLst.add(doAgain);
        locator<Utilities>().printLog(
            "Class RequestApi === Func handlerDoneApi === doAgainDoneApis: ${doAgainhandlerDoneApiLst.length}",
            isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
        if (doAgainhandlerDoneApiLst.length <= 1) {
          // await refreshToken(context, doAgain);
          await refreshToken(context, callFunctionDoneApi);
        }
      }
    } else {
      handlerError(context, apiCallBack, response.toString());
    }
  }

  Future refreshToken(BuildContext context, Function callback) async {
    locator<Utilities>().printLog('Class RequestApi === Function refreshToken');
    var preferences = await SharedPreferences.getInstance();
    var firebaseId = preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";

    ApiCallBack listCallBack = ApiCallBack((BaseResponse baseResponse) async {
      var preferences = await SharedPreferences.getInstance();
      var authenticationString = JsonEncoder().convert(baseResponse.data);
      preferences.setString(Constants.KEY_AUTHENTICATE, authenticationString);
      preferences.setInt(Constants.KEY_LAST_REFRESH, DateTime.now().millisecondsSinceEpoch);
      callback();
    }, (Errors message) {
      if (message.code != -2) {
        locator<Utilities>().popupAndSignOut(context, cancelableLogout, AppLocalizations.of(context).expiredToken);
      }
    });

    var authorization = await locator<Utilities>().getAuthorizationNoPreferences();
    var token = (authorization as Authenticate).refreshToken;
    await ApiRequest().requestRefreshTokenApi(context, firebaseId, token, listCallBack);
  }

  Future<CancelableOperation<dynamic>> requestRefreshTokenApi(
      BuildContext context, String firebaseId, String refreshToken, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_FIREBASE_TOKEN] = firebaseId;
    body[Constants.FIELD_REFRESH_TOKEN] = refreshToken;
    return createPostService(context, ApiServicePost.POST_API_NO_AUTHENTICATE, ResponseType.OBJECT,
        Constants.PATH_REFRESH_TOKEN, body, apiCallBack, null);
  }

  Future<CancelableOperation<dynamic>> requestLoginApi(
      BuildContext context,
      String username,
      String password,
      String firebaseToken,
      DeviceInfo deviceInfo,
      DeviceEmployee deviceEmployeeInfo,
      String domain,
      ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_USER_NAME] = username.trim();
    body[Constants.FIELD_PASSWORD] = password;
    if (firebaseToken.isEmpty) {
      firebaseToken =
          'f07Q8plAkUHntSGP4gAwzR:APA91bFpDfYFX5OVsER-JSbLPAIzX3iEx7K4_DqVbFjX2IbBZcrs84-Pr1YcUcXRhaDXWubvmeXR2SdnA9pvMcl4pCKINoQCH5yb86wKoVWJJmvfZ5T0ckmYmPVL2Qs9i5sYSnZiBvce';
    }
    body[Constants.KEY_FIREBASE_TOKEN] = firebaseToken;
    body[Constants.FIELD_DEVICE] = deviceInfo.toMap();
    body[Constants.FIELD_DOMAIN] = domain;
    body["deviceEmployee"] = deviceEmployeeInfo.toMap();

    var doAgain = () {
      requestLoginApi(context, username, password, firebaseToken, deviceInfo, deviceEmployeeInfo, domain, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API_NO_AUTHENTICATE, ResponseType.OBJECT,
        Constants.PATH_AUTHENTICATE, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestValidateEmail(BuildContext context, String emailAddress, String domain,
      DeviceEmployee deviceEmployee, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_EMAIL_ADDRESS] = emailAddress.trim();
    body['domain'] = domain;
    body['os'] = deviceEmployee.os;
    body['deviceId'] = deviceEmployee.deviceId;
    body['deviceName'] = deviceEmployee.deviceName;

    var doAgain = () {
      requestValidateEmail(context, emailAddress, domain, deviceEmployee, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API_NO_AUTHENTICATE, ResponseType.OBJECT,
        Constants.PATH_VALIDATE_EMAIL, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestValidatePassCode(BuildContext context, String emailAddress,
      String passCode, String deviceId, String os, String deviceName, String domain, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_EMAIL_ADDRESS] = emailAddress.trim();
    body[Constants.FIELD_PASS_CODE] = passCode;
    body['domain'] = domain;
    body["deviceId"] = deviceId;
    body["os"] = os;
    body["deviceName"] = deviceName;

    var doAgain = () {
      requestValidatePassCode(context, emailAddress, passCode, deviceId, os, deviceName, domain, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API_NO_AUTHENTICATE, ResponseType.OBJECT,
        Constants.PATH_VALIDATE_PASS_CODE, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestChangePassword(
      BuildContext context, String password, String code, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_PASSWORD] = password;
    body[Constants.FIELD_CODE] = code;

    var doAgain = () {
      requestChangePassword(context, password, code, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API_NO_AUTHENTICATE, ResponseType.OBJECT,
        Constants.PATH_CHANGE_PASSWORD, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestForgotPassword(
      BuildContext context, String emailAddress, DeviceEmployee deviceEmployee, String domain, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_USER_NAME] = emailAddress.trim();
    body['domain'] = domain;
    body["deviceId"] = deviceEmployee.deviceId;
    body["os"] = deviceEmployee.os;
    body["deviceName"] = deviceEmployee.deviceName;

    var doAgain = () {
      requestForgotPassword(context, emailAddress, deviceEmployee, domain, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API_NO_AUTHENTICATE, ResponseType.OBJECT,
        Constants.PATH_FORGOT_PASSWORD, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetExpected(
      BuildContext context, String timezone, int pageIndex, int pageSize, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_TIME_ZONE] = timezone;
    body[Constants.FIELD_PAGE_INDEX] = pageIndex;
    body[Constants.FIELD_PAGE_SIZE] = pageSize;
    body[Constants.FIELD_IS_DESC] = true;
    body[Constants.FIELD_IS_PAGING] = true;

    var doAgain = () {
      requestGetExpected(context, timezone, pageIndex, pageSize, apiCallBack);
    };
    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_GET_EXPECTED, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestEmployee(
      BuildContext context, String keyword, int pageIndex, int pageSize, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_KEYWORD] = keyword;
    body[Constants.FIELD_PAGE_INDEX] = pageIndex;
    body[Constants.FIELD_PAGE_SIZE] = pageSize;

    var doAgain = () {
      requestEmployee(context, keyword, pageIndex, pageSize, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_EMPLOYEE_SEARCM,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetToday(
      BuildContext context, String timezone, int pageIndex, int pageSize, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_TIME_ZONE] = timezone;
    body[Constants.FIELD_PAGE_INDEX] = pageIndex;
    body[Constants.FIELD_PAGE_SIZE] = pageSize;
    body[Constants.FIELD_IS_DESC] = true;
    body[Constants.FIELD_IS_PAGING] = true;

    var doAgain = () {
      requestGetToday(context, timezone, pageIndex, pageSize, apiCallBack);
    };
    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_GET_TODAY, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestLogByCondition(BuildContext context, String timezone, int pageIndex,
      int pageSize, String status, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_TIME_ZONE] = timezone;
    body[Constants.FIELD_PAGE_INDEX] = pageIndex;
    body[Constants.FIELD_PAGE_SIZE] = pageSize;
    body[Constants.FIELD_STATUS] = status;
    body[Constants.FIELD_IS_DESC] = true;
    body[Constants.FIELD_IS_PAGING] = true;

    var doAgain = () {
      requestLogByCondition(context, timezone, pageIndex, pageSize, status, apiCallBack);
    };
    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_GET_LOG, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestUserInfor(
      BuildContext context, String deviceId, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_DEVICE_ID] = deviceId;

    var doAgain = () {
      requestUserInfor(context, deviceId, apiCallBack);
    };

    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_USER_INFOR, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestLocationInfor(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestLocationInfor(context, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST, Constants.PATH_LOCATION_INFOR,
        apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestImage(BuildContext context, String path, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestImage(context, path, apiCallBack);
    };

    return createGetFile(context, ResponseType.FILE, path, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestLocation(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestLocation(context, apiCallBack);
    };

    return createGetService(
        context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST, Constants.PATH_LOCATION, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestAllCompanyBuilding(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestAllCompanyBuilding(context, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST,
        Constants.PATH_BUILDING_ALL_COMPANY, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestCheckVersion(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestCheckVersion(context, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT, Constants.PATH_CHECK_VERSION,
        apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestVisitorCheckIn(
      BuildContext context, double preRegisterId, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestVisitorCheckIn(context, preRegisterId, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_CHECK_IN + preRegisterId.toString(), null, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestScanQR(
      BuildContext context, String secretKey, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_SECRET_KEY] = secretKey;

    var doAgain = () {
      requestScanQR(context, secretKey, apiCallBack);
    };

    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_SCAN_QR, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestCheckInEventTicket(
      BuildContext context, String inviteCode, double eventId, ApiCallBack apiCallBack) {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_QR_CODE] = inviteCode?.toLowerCase();
    body[Constants.FIELD_EVENT_ID] = eventId;

    var doAgain = () {
      requestCheckInEventTicket(context, inviteCode, eventId, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_EVENT_TICKET_CHECK_IN, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestCreateOrder(
      BuildContext context, ETNewOrder etNewOrder, ApiCallBack apiCallBack) {
    var doAgain = () {
      requestCreateOrder(context, etNewOrder, apiCallBack);
    };
    return createPostService(
      context,
      ApiServicePost.POST_API,
      ResponseType.OBJECT,
      Constants.PATH_CREATE_ORDER,
      etNewOrder.toJson(),
      apiCallBack,
      doAgain,
    );
  }

  Future<CancelableOperation<dynamic>> requestEmployeeCheckin(BuildContext context, double latitude, double longitude,
      String token, String surveyAnswer, double surveyId, double branchId, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body["latitude"] = latitude;
    body["longitude"] = longitude;
    body["token"] = token;
    body["surveyAnswer"] = surveyAnswer;
    body["surveyId"] = surveyId;
    body["branchId"] = branchId;

    var doAgain = () {
      requestEmployeeCheckin(context, latitude, longitude, token, surveyAnswer, surveyId, branchId, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_EMPLOYEE_ATTENDANCE_CHECKIN, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestEmployeeCheckinNoValidation(
      BuildContext context,
      double latitude,
      double longitude,
      String token,
      String surveyAnswer,
      double surveyId,
      double branchId,
      ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body["latitude"] = latitude;
    body["longitude"] = longitude;
    body["token"] = token;
    body["surveyAnswer"] = surveyAnswer;
    body["surveyId"] = surveyId;
    body["branchId"] = branchId;

    var doAgain = () {
      requestEmployeeCheckinNoValidation(
          context, latitude, longitude, token, surveyAnswer, surveyId, branchId, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_EMPLOYEE_ATTENDANCE_CHECKIN_NO_VALIDATION, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestVisitorCheckOut(
      BuildContext context, double preRegisterId, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestVisitorCheckIn(context, preRegisterId, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_CHECK_OUT + preRegisterId.toString(), null, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestInvitation(
      BuildContext context, double branchId, VisitorCheckIn visitorCheckIn, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestInvitation(context, branchId, visitorCheckIn, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_INVITATION + branchId.toString(), null, apiCallBack, doAgain);
  }

  // Future<CancelableOperation<dynamic>> requestLogout(
  //     BuildContext context,
  //     String deviceId,
  //     String refreshToken,
  //     String firebaseToken,
  //     ApiCallBack apiCallBack) async {
  //   Map<String, dynamic> body = Map<String, dynamic>();
  //   body[Constants.FIELD_DEVICE_ID] = deviceId;
  //   body[Constants.FIELD_REFRESH_TOKEN] = refreshToken;
  //   body[Constants.FIELD_FIREBASE_TOKEN] = firebaseToken;

  //   var doAgain = () {
  //     requestLogout(
  //         context, deviceId, refreshToken, firebaseToken, apiCallBack);
  //   };

  //   return createPostService(context, ApiServicePost.POST_API,
  //       ResponseType.OBJECT, Constants.PATH_LOGOUT, body, apiCallBack, doAgain);
  // }

  Future<CancelableOperation<dynamic>> requestUploadFace(
      BuildContext context, double visitorLogId, String captureFaceFile, ApiCallBack apiCallBack) async {
    List<int> imageBytes = await locator<Utilities>().rotateAndResize(captureFaceFile);
    final file = MultipartFile.fromBytes(Constants.FIELD_FACE_FILE, imageBytes,
        filename: "${Constants.FIELD_FACE_FILE}.${Constants.PNG_ETX}");

    var doAgain = () {
      requestUploadFace(context, visitorLogId, captureFaceFile, apiCallBack);
    };

    return createUploadService(context, ApiServiceUpload.POST_FILE_ID, ResponseType.OBJECT,
        Constants.PATH_UPLOAD_FACE_CAPTURE, visitorLogId, null, file, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestVisitorType(
      BuildContext context, ApiCallBack apiCallBack, String branchId) async {
    var doAgain = () {
      requestVisitorType(context, apiCallBack, branchId);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST,
        Constants.PATH_VISITOR_TYPE + '/$branchId', apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetAllEventTicket(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetAllEventTicket(context, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST,
        Constants.PATH_ALL_EVENT_TICKET, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestEventTicketDetails(
      BuildContext context, double eventId, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestEventTicketDetails(context, eventId, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_ALL_EVENT_TICKET_DETAIL + eventId.toString(), apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestPaidOrder(
      BuildContext context, double orderId, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestPaidOrder(context, orderId, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_PAID_ORDER + orderId.toString(), apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestBranchInfor(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestBranchInfor(context, apiCallBack);
    };

    return createGetService(
      context,
      ApiServiceGet.GET_API_WITH_PATH,
      ResponseType.LIST,
      Constants.PATH_GET_BRANCHES,
      apiCallBack,
      doAgain,
    );
  }

  Future<CancelableOperation<dynamic>> requestInviteNewVisitor(
      BuildContext context, InviteNewVisitor model, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body = model.toJson();

    var doAgain = () {
      requestInviteNewVisitor(context, model, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_INVITE_NEW_VISITOR,
        body, apiCallBack, doAgain);
  }

  /**
   * @author: Danghld
   */
  Future<CancelableOperation<dynamic>> requestGetEmployeeInfo(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetEmployeeInfo(context, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT, Constants.PATH_EMPLOYEE_INFO,
        apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetEventToday(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetEventToday(context, apiCallBack);
    };

    return createGetService(
        context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST, Constants.PATH_EVENT_TODAY, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestSearchInviteVisitor(
      BuildContext context, int pageIndex, int pageSize, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['pageIndex'] = pageIndex;
    body['pageSize'] = pageSize;
    body['orderBy'] = 'vlog.sign_in';
    body['isDesc'] = false;

    var doAgain = () {
      requestSearchInviteVisitor(context, pageIndex, pageSize, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_INVITE_VISITOR_SEARCH,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestCalendarInviteVisitor(
      BuildContext context, int month, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['month'] = month;

    var doAgain = () {
      requestCalendarInviteVisitor(context, month, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_MONTH_INVITE_VISITOR,
        body, apiCallBack, doAgain);
  }

  /**
   *
   */

  Future<CancelableOperation<dynamic>> requestGetEmployee(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetEmployee(context, apiCallBack);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_GET_EMPLOYEE_INFO, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetEmployeeSetting(BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetEmployeeSetting(context, apiCallBack);
    };
    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_GET_EMPLOYEE_SETTING, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestSearchVisitorLog(
      BuildContext context, int pageIndex, int pageSize, bool notYetCheckOut, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['pageIndex'] = pageIndex;
    body['pageSize'] = pageSize;
    body['notYetCheckOut'] = notYetCheckOut;
    body['isDesc'] = true;

    var doAgain = () {
      requestSearchVisitorLog(context, pageIndex, pageSize, notYetCheckOut, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_VISITOR_LOG_SEARCH,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestSignOutApi(
      BuildContext context, String firebaseToken, String refreshToken, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_FIRE_BASE_ID] = firebaseToken;
    body[Constants.FIELD_REFRESH_TOKEN] = refreshToken;

    var doAgain = () {
      requestSignOutApi(context, firebaseToken, refreshToken, apiCallBack);
    };
    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_SIGN_OUT, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestNotifications(
      BuildContext context, ApiCallBack apiCallBack, int pageIndex, int pageSize, String deviceId) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[Constants.FIELD_PAGE_INDEX] = pageIndex;
    body[Constants.FIELD_PAGE_SIZE] = pageSize;
    body[Constants.FIELD_DEVICE_ID] = deviceId;

    var doAgain = () {
      requestNotifications(context, apiCallBack, pageIndex, pageSize, deviceId);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_NOTIFICATION_SEARCH,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestReadAllNotification(
      BuildContext context, ApiCallBack apiCallBack, String deviceId) async {
    var doAgain = () {
      requestReadAllNotification(context, apiCallBack, deviceId);
    };

    return createPutService(context, ApiServicePut.PUT_API, ResponseType.OBJECT,
        Constants.PATH_UPDATE_READ_ALL_NOTIFICATION + '/$deviceId', Map<String, dynamic>(), apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestReadByIdNotification(
      BuildContext context, ApiCallBack apiCallBack, int id, int status) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['isRead'] = status;

    var doAgain = () {
      requestReadByIdNotification(context, apiCallBack, id, status);
    };

    return createPutService(context, ApiServicePut.PUT_API, ResponseType.OBJECT,
        Constants.PATH_UPDATE_READ_NOTIFICATION + '/$id', body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestDeleteRangeNotification(
      BuildContext context, ApiCallBack apiCallBack, List<int> lstId) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['ids'] = lstId;

    var doAgain = () {
      requestDeleteRangeNotification(context, apiCallBack, lstId);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_DELETE_RANGE_NOTIFICATION, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestDeleteByIdNotification(
      BuildContext context, ApiCallBack apiCallBack, int id) async {
    var doAgain = () {
      requestDeleteByIdNotification(context, apiCallBack, id);
    };

    return createDeleteService(context, ApiServiceDelete.DELETE_API, ResponseType.OBJECT,
        Constants.PATH_DELETE_NOTIFICATION + '/$id', apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetTotalUnreadNotification(
      BuildContext context, ApiCallBack apiCallBack, String deviceId) async {
    var doAgain = () {
      requestGetTotalUnreadNotification(context, apiCallBack, deviceId);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_TOTAL_UNREAD_NOTIFICATION + '/$deviceId', apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetEventDetail(
      BuildContext context, ApiCallBack apiCallBack, int eventId) async {
    var doAgain = () {
      requestGetEventDetail(context, apiCallBack, eventId);
    };

    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_EVENTS_DETAIL + '/$eventId', apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetEventGuests(BuildContext context, ApiCallBack apiCallBack, int eventId,
      int pageIndex, int pageSize, String searchText) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['eventId'] = eventId;
    body['pageIndex'] = pageIndex;
    body['pageSize'] = pageSize;
    body['guestEmail'] = searchText;
    body['guestPhone'] = searchText;
    body['guestName'] = searchText;
    body['inviteCode'] = searchText;

    var doAgain = () {
      requestGetEventGuests(context, apiCallBack, eventId, pageIndex, pageSize, searchText);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_GET_EVENTS_GUESTS,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetEventGuestAll(
      BuildContext context, double eventId, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetEventGuestAll(context, eventId, apiCallBack);
    };
    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.LIST,
        Constants.PATH_GET_EVENTS_GUESTS_All + '/$eventId', apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestEventAction(
      BuildContext context, ApiCallBack apiCallBack, String inviteCode) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['inviteCode'] = inviteCode;

    var doAgain = () {
      requestEventAction(context, apiCallBack, inviteCode);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_ACTION_CHECKINOUT_EVENT, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestMyVisitor(
      BuildContext context, int pageIndex, int pageSize, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['pageIndex'] = pageIndex;
    body['pageSize'] = pageSize;

    var doAgain = () {
      requestMyVisitor(context, pageIndex, pageSize, apiCallBack);
    };

    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_MY_VISITOR, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetInvitationToday(
      BuildContext context, ApiCallBack apiCallBack, String clientDate, int exceedingSeconds) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['clientDate'] = clientDate;
    body['exceedingSeconds'] = exceedingSeconds;
    var doAgain = () {
      requestGetInvitationToday(context, apiCallBack, clientDate, exceedingSeconds);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_INVITATION_TODAY, body,
        apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestChangePw(
      BuildContext context, String oldPassword, String newPassword, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['oldPassword'] = oldPassword;
    body['newPassword'] = newPassword;
    var doAgain = () {
      requestChangePw(context, oldPassword, newPassword, apiCallBack);
    };

    return createPostService(
        context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_CHANGE_PW, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestUploadAvatar(
      BuildContext context, String captureFaceFile, ApiCallBack apiCallBack) async {
    List<int> imageBytes = await locator<Utilities>().rotateAndResize(captureFaceFile);
    final file = MultipartFile.fromBytes("fileContent", imageBytes,
        filename: "${Constants.FIELD_FACE_FILE}.${Constants.PNG_ETX}");

    var doAgain = () {
      requestUploadAvatar(context, captureFaceFile, apiCallBack);
    };

    return createUploadService(context, ApiServiceUpload.POST_AVATAR, ResponseType.OBJECT, Constants.PATH_UPLOAD_AVATAR,
        0, null, file, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestDeleteAvatar(BuildContext context, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    var doAgain = () {
      requestDeleteAvatar(context, apiCallBack);
    };

    return createPostService(
      context,
      ApiServicePost.POST_API,
      ResponseType.OBJECT,
      Constants.PATH_DELETE_AVATAR,
      body,
      apiCallBack,
      doAgain,
    );
  }

  Future<CancelableOperation<dynamic>> requestGetCheckDomainRegister(
      BuildContext context, String companyUrl, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetCheckDomainRegister(context, companyUrl, apiCallBack);
    };
    return createGetService(context, ApiServiceGet.GET_API_WITHOUT_TOKEN, ResponseType.OBJECT,
        Constants.PATH_CHECK_DOMAIN_REGISTER + '/$companyUrl', apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestUpdateProFile(
      BuildContext context, Map<String, dynamic> body, String id, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestUpdateProFile(context, body, id, apiCallBack);
    };

    return createPostService(context, ApiServicePost.PUT_API, ResponseType.OBJECT, Constants.PATH_EDIT_PRO_FILE + id,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestUpdateNotification(
      BuildContext context, int email, int pushNotification, int viber, int zalo, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['PushEmail'] = email;
    body['PushNotification'] = pushNotification;
    body['Viber'] = viber;
    body['Zalo'] = zalo;

    var doAgain = () {
      requestUpdateNotification(context, email, pushNotification, viber, zalo, apiCallBack);
    };

    return createPostService(context, ApiServicePost.PUT_API, ResponseType.OBJECT, Constants.PATH_UPDATE_NOTIFICATION,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestUpdateNotiIntegration(
      BuildContext context, String seviceName, int status, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestUpdateNotiIntegration(context, seviceName, status, apiCallBack);
    };
    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_UPDATE_INTEGRATION_SETTING + seviceName + '/' + status.toString(), apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestUpdateIntegration(
      BuildContext context, int viber, int zalo, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['viber'] = viber;
    body['zalo'] = zalo;
    var doAgain = () {
      requestUpdateIntegration(context, viber, zalo, apiCallBack);
    };

    return createPostService(context, ApiServicePost.PUT_API, ResponseType.OBJECT, Constants.PATH_UPDATE_INTEGRATION,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetToDayAttendanceInfo(
      BuildContext context, ApiCallBack apiCallBack) async {
    var doAgain = () {
      requestGetToDayAttendanceInfo(context, apiCallBack);
    };
    return createGetService(context, ApiServiceGet.GET_API_WITH_PATH, ResponseType.OBJECT,
        Constants.PATH_GET_TODAY_ATTTENDANCE_INFO, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestPostAttendanceDetail(
      BuildContext context, DateTime dateTime, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['date'] = DateFormat(Constants.DATE_FORMAT_TO_SQL).format(dateTime);
    var doAgain = () {
      requestPostAttendanceDetail(context, dateTime, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST,
        Constants.PATH_GET_EMPLOYEE_ATTENDANCE_DETAIL, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetWelcomeMessage(
      BuildContext context, List<double> locationId, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['locationIds'] = locationId;
    var doAgain = () {
      requestGetWelcomeMessage(context, locationId, apiCallBack);
    };
    return createPostService(
      context,
      ApiServicePost.POST_API,
      ResponseType.LIST,
      Constants.PATH_WELCOME_MESSAGE,
      body,
      apiCallBack,
      doAgain,
    );
  }

  Future<CancelableOperation<dynamic>> requestPostAttendanceChart(BuildContext context, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    var doAgain = () {
      requestPostAttendanceChart(context, apiCallBack);
    };
    return createPostService(context, ApiServicePost.POST_API, ResponseType.LIST, Constants.PATH_ATTENDANCE_CHART, body,
        apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetWorkingTimeInfo(
      BuildContext context, ApiCallBack apiCallBack, DateTime date) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['date'] = DateFormat(Constants.DATE_FORMAT_TO_SQL).format(date);
    var doAgain = () {
      requestGetWorkingTimeInfo(context, apiCallBack, date);
    };
    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_GET_WORKING_TIME_INFO, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestSyncEventGuest(
      BuildContext context, List<EventCheckInSync> lstEventCheckInSync, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['leeHao'] = lstEventCheckInSync.map((e) => e.toJson()).toList();
    var doAgain = () {
      requestSyncEventGuest(context, lstEventCheckInSync, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT, Constants.PATH_SYNC_EVENT_GUEST,
        body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestSyncInvitationVisitor(
      BuildContext context, List<VisitorInviteCheckinSync> lstVisitorInviteCheckinSync, ApiCallBack apiCallBack) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body['leeHao'] = lstVisitorInviteCheckinSync.map((e) => e.toJson()).toList();
    var doAgain = () {
      requestSyncInvitationVisitor(context, lstVisitorInviteCheckinSync, apiCallBack);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_SYNC_INVITATION_VISITOR, body, apiCallBack, doAgain);
  }

  Future<CancelableOperation<dynamic>> requestGetHealthDeclaration(BuildContext context, ApiCallBack apiCallBack,
      double branchId, double accountId, double latitude, double longitude, String token) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body["latitude"] = latitude;
    body["longitude"] = longitude;
    body["token"] = token;
    body["branchId"] = branchId;
    body["accountId"] = accountId;
    var doAgain = () {
      requestGetHealthDeclaration(context, apiCallBack, branchId, accountId, latitude, longitude, token);
    };

    return createPostService(context, ApiServicePost.POST_API, ResponseType.OBJECT,
        Constants.PATH_GET_HEALTH_DECLARATION, body, apiCallBack, doAgain);
  }

  bool handlerCompleteFuture(BuildContext context, ApiCallBack apiCallBack, Response response, ResponseType type) {
    String statusCode = getStatusCodeRequestAPI(response, type);

    if (statusCode == Constants.STATUS_SUCCESS) {
      switch (type) {
        case ResponseType.FILE:
          {
            apiCallBack.onSuccessFile(response.bodyBytes, response.headers["content-type"]);
            break;
          }
        case ResponseType.OBJECT:
          {
            var baseResponse = BaseResponse.fromJson(response.body);
            apiCallBack.onSuccess(baseResponse);
            break;
          }
        case ResponseType.LIST:
          {
            var baseListResponse = BaseListResponse.fromJson(response.body);
            apiCallBack.onSuccessList(baseListResponse);
            break;
          }
      }
      return true;
    } else {
      Utilities().printLog(
          'Class RequestApi === Function handlerCompleteFuture === Path: ${response.base.request.url.path} === Status code: $statusCode',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
      switch (statusCode) {
        case Constants.B500:
          {
            Errors errors = Errors(-1, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case Constants.B401:
          {
            if (response.base.request.url.path.contains(Constants.PATH_REFRESH_TOKEN)) {
              CancelableOperation cancelableLogout;
              locator<Utilities>()
                  .popupAndSignOut(context, cancelableLogout, AppLocalizations.of(context).expiredToken);
              break;
            } else if (response.base.request.url.path.contains(Constants.PATH_CONFIGURATION)) {
              Errors errors = Errors(-1, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
              apiCallBack.onError(errors);
              return true;
            }
            return false;
          }
        case Constants.B400:
          {
            Errors errors = Errors(-1, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case Constants.B403:
          {
            CancelableOperation cancelableLogout;
            locator<Utilities>().popupAndSignOut(context, cancelableLogout, AppLocalizations.of(context).noPermission);
            break;
          }
        //general
        case "GEN_DataNotFound":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).noData, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "VIS_NoVisitorInformation":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).noVisitor, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "GEN_InvalidParam":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EVENT_InviteCodeNotFound":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).errorInviteCode, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EVENT_AlreadyCheckout":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).noPhone, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EVENT_NotYetCheckin":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).noVisitor, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "GEN_InvalidId":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "GEN_CreateFailed":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "GEN_UpdateFailed":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_CantFindOrderDetail":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).inviteCodeError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_OrderNotPaid":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).orderNotPaid, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_OrderDetailUsed":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).inviteCodeUsed, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_CantFindEventInfo":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).inviteCodeError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_EventExpired":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).eventExpired, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_EventInvalid":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).inviteCodeError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "OrderDetailService_CantFindGuestInfo":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).inviteCodeError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EVENTAD_Order_Paid":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).paidAlready, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        //account
        case "ACC_MissingXAuth":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_MissingUsername":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).errorNoUserName, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_MissingPwd":
          {
            Errors errors = Errors(1, AppLocalizations.of(context).errorNoPassword, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_WrongUsername":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).emailNotExist, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_Locked":
          {
            Errors errors = Errors(-1, AppLocalizations.of(context).accountLocked, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_Deactive":
          {
            Errors errors = Errors(-1, AppLocalizations.of(context).accountDeactivated, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_AccountIsNotActive":
          {
            Errors errors = Errors(-1, AppLocalizations.of(context).accountDeactivated, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_WrongPwd":
          {
            Errors errors = Errors(1, AppLocalizations.of(context).wrongPassword, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "REFTOKEN_NotFound":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).refreshTokenNotFound, DialogType.INFO);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_InvalidToken":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).changedConfiguration, DialogType.INFO);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_ExpiredToken":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).expiredToken, DialogType.INFO);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_InvalidRefreshToken":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).changedConfiguration, DialogType.INFO);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_NotFoundRoles":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).noPermission, DialogType.INFO);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_ExpiredRefreshToken":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).expiredToken, DialogType.INFO);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_EmailNotFound":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).emailNotExist, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        //filefolder
        case "FOLDER_CreateFail":
          {
            Errors errors = Errors(0, "File upload failed. Cannot create folder", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "FILE_NotFound":
          {
            Errors errors = Errors(0, "File not found", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        //company
        case "CO_InvalidName":
          {
            Errors errors = Errors(0, "Invalid Name", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "VIS_IsRequired_PhoneNumber":
          {
            Errors errors = Errors(0, "VIS_IsRequired_PhoneNumber", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EA_PasscodeInvalid":
          {
            Errors errors = Errors(0, "EA_PasscodeInvalid", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EA_PasscodeExpired":
          {
            Errors errors = Errors(0, "EA_PasscodeExpired", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "ACC_Action_Expire":
          {
            Errors errors = Errors(0, "ACC_Action_Expire", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EVENT_CannotCheckIn":
          {
            Errors errors = Errors(0, "EVENT_CannotCheckIn", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case Constants.COM_WRONGDOMAIN:
          {
            Errors errors = Errors(0, Constants.COM_WRONGDOMAIN, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "INV_AlreadyCheckout":
          {
            Errors errors = Errors(0, AppLocalizations.of(context).noPhone, DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "INV_CannotCheckIn":
          {
            Errors errors = Errors(0, "INV_CannotCheckIn", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EA_LocationInvalid":
          {
            Errors errors = Errors(0, "EA_LocationInvalid", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EA_InvalidQr":
          {
            Errors errors = Errors(0, "EA_InvalidQr", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EA_InvalidCompanyOrBranch":
          {
            Errors errors = Errors(0, "EA_InvalidCompanyOrBranch", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "EA_QrExpired":
          {
            Errors errors = Errors(0, "EA_QrExpired", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "DE_RuleOneAccOneDevice":
          {
            Errors errors = Errors(0, "DE_RuleOneAccOneDevice", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "CO_NumberOfDevicesExceedsLimit":
          {
            Errors errors = Errors(0, "CO_NumberOfDevicesExceedsLimit", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        case "SURVEY_INVALID":
          {
            Errors errors = Errors(0, "SURVEY_INVALID", DialogType.ERROR);
            apiCallBack.onError(errors);
            break;
          }
        default:
          {
            if (statusCode.contains("EVENTAD_Over_Remaining_Ticket")) {
              var numTicket = statusCode.split("_").last;
              String content = AppLocalizations.of(context).remainTicketError.replaceAll(Constants.replaceField, numTicket);
              if (numTicket == "0") {
                content = AppLocalizations.of(context).noTicketError;
              }
              Errors errors = Errors(
                  -1,
                  content,
                  DialogType.ERROR);
              apiCallBack.onError(errors);
              break;
            } else {
              Errors errors = Errors(-1, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
              apiCallBack.onError(errors);
              break;
            }
          }
      }
      return true;
    }
  }

  String getStatusCodeRequestAPI(Response response, ResponseType type) {
    if (response.isSuccessful) {
      var baseResponse;
      switch (type) {
        case ResponseType.FILE:
          {
            return Constants.STATUS_SUCCESS;
          }
        case ResponseType.OBJECT:
          {
            baseResponse = BaseResponse.fromJson(response.body);
            break;
          }
        case ResponseType.LIST:
          {
            baseResponse = BaseListResponse.fromJson(response.body);
            break;
          }
      }
      if (baseResponse.success) {
        return Constants.STATUS_SUCCESS;
      }
      if (baseResponse.errors != null && baseResponse.errors.isNotEmpty) return baseResponse.errors[0];
      return Constants.B500;
    }
    return response.statusCode.toString();
  }

  handlerError(BuildContext context, ApiCallBack apiCallBack, String message) {
    locator<Utilities>().printLog('handlerError === $message', isOutputFile: true);
    Errors errors;
    try {
      errors = Errors(-1, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
      apiCallBack.onError(errors);
    } catch (e) {
      locator<Utilities>().printLog(e.toString());
      try {
        errors = Errors(-1, AppLocalizations.of(context).messageCommonError, DialogType.ERROR);
        apiCallBack.onError(errors);
      } catch (e) {
        errors = Errors(-1001, AppLocalizations.of(context).somethingWrongContent, DialogType.ERROR);
        apiCallBack.onError(errors);
      }
    }
  }

  void catchSocketException(dynamic socketException) {
    if (socketException is SocketException) {
      locator<Utilities>().printLog(socketException.toString());
      var socket = socketException;
      locator<Utilities>().printLog(socket.message);
      locator<Utilities>().printLog(socket.port.toString());
      locator<Utilities>().printLog(socket.address.toString());
      locator<Utilities>().printLog(socket.osError.toString());
    }
    if (socketException is Response) {
      locator<Utilities>().printLog(socketException.toString());
      locator<Utilities>().printLog(socketException.bodyString);
      locator<Utilities>().printLog(socketException.body.toString());
    }
    locator<Utilities>().printLog(socketException.toString());
  }
}
