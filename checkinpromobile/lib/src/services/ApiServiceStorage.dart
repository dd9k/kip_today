import 'dart:io';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/services/MobileDataInterceptor.dart';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart';
import 'ServiceLocator.dart';
part 'ApiServiceStorage.chopper.dart';


//final $url = '${Constants.URL_LIST[locator<Constants>().indexURL]}${path}';
@ChopperApi(baseUrl: "")
abstract class ApiServiceStorage extends ChopperService {
  @Get(path: '{path}')
  Future<dynamic> getImage(@Path('path') String path);

  static ApiServiceStorage create() {
    HttpClient httpclient = new HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    httpclient.connectionTimeout = Constants.CONNECTION_TIME_OUT;
    var ioClient = new IOClient(httpclient);
    final client = ChopperClient(
      baseUrl: '',
      services: [
        _$ApiServiceStorage(),
      ],client: ioClient,
      converter: JsonConverter(),
      interceptors: [MobileDataInterceptor()
      ,HttpLoggingInterceptor()
      ],
    );
    return _$ApiServiceStorage(client);
  }
}
