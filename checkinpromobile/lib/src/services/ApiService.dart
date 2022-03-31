import 'dart:io';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/services/MobileDataInterceptor.dart';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' show MultipartFile;
import 'ServiceLocator.dart';
part 'ApiService.chopper.dart';

//final $url = '${Constants.URL_LIST[locator<Constants>().indexURL]}${path}';
@ChopperApi(baseUrl: "")
abstract class ApiService extends ChopperService {
  @Post(path: '{path}', headers: {'Content-Type': 'application/json'})
  Future<dynamic> postApi(
      @Path('path') String path,
      @Header('Authorization') String authorization,
      @Body() Map<String, dynamic> body);

  @Post(path: '{path}', headers: {'Content-Type': 'multipart/form-data'})
  @multipart
  Future<dynamic> postApiUploadFace(
    @Path('path') String path,
    @Header('Authorization') String authorization,
    @Part(Constants.FIELD_VISITOR_LOG_ID) double visitorLogId,
    @PartFile() MultipartFile image,
  );

  @Post(path: '{path}', headers: {'Content-Type': 'multipart/form-data'})
  @multipart
  Future<dynamic> postApiSync(
      @Path('path') String path,
      @Header('Authorization') String authorization,
      @Part(Constants.FIELD_VISITOR) String json,
      @PartFile() MultipartFile image);

  @Post(path: '{path}', headers: {'Content-Type': 'application/json'})
  Future<dynamic> postApiNoAuthenticate(
      @Path('path') String path, @Body() Map<String, dynamic> body);

  @Get(path: '{path}')
  Future<dynamic> getAPIWithoutToken(@Path('path') String path);

  @Get(path: '{path}')
  Future<dynamic> getAPIWithPath(
      @Path('path') String path, @Header('Authorization') String authorization);

  @Put(path: '{path}')
  Future<dynamic> putAPI(
      @Path('path') String path,
      @Header('Authorization') String authorization,
      @Body() Map<String, dynamic> body);

  @Delete(path: '{path}')
  Future<dynamic> deleteAPI(
      @Path('path') String path, @Header('Authorization') String authorization);

  @Post(path: '{path}', headers: {'Content-Type': 'multipart/form-data'})
  @multipart
  Future<dynamic> postApiUploadAvatar(
    @Path('path') String path,
    @Header('Authorization') String authorization,
    @PartFile() MultipartFile image,
  );

  @Put(path: '{path}', headers: {'Content-Type': 'application/json'})
  Future<dynamic> putApi(
      @Path('path') String path,
      @Header('Authorization') String authorization,
      @Body() Map<String, dynamic> body);

  static ApiService create() {
    HttpClient httpclient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    httpclient.connectionTimeout = Constants.CONNECTION_TIME_OUT;
    var ioClient = new IOClient(httpclient);
    final client = ChopperClient(
      baseUrl: Constants.URL_LIST[Constants().indexURL],
      services: [
        _$ApiService(),
      ],
      client: ioClient,
      converter: JsonConverter(),
      interceptors: [
        MobileDataInterceptor(),
         HttpLoggingInterceptor()
      ],
    );
    return _$ApiService(client);
  }
}
