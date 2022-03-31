// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future postApi(String path, String authorization, Map<String, dynamic> body) {
    final $url = '${path}';
    final $headers = {
      'Authorization': authorization,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send($request);
  }

  Future postApiUploadFace(String path, String authorization,
      double visitorLogId, MultipartFile image) {
    final $url = '${path}';
    final $headers = {
      'Authorization': authorization,
      'Content-Type': 'multipart/form-data'
    };
    final $parts = <PartValue>[
      PartValue<double>('visitorLogId', visitorLogId),
      PartValueFile<MultipartFile>('image', image)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send($request);
  }

  Future postApiSync(
      String path, String authorization, String json, MultipartFile image) {
    final $url = '${path}';
    final $headers = {
      'Authorization': authorization,
      'Content-Type': 'multipart/form-data'
    };
    final $parts = <PartValue>[
      PartValue<String>('visitor', json),
      PartValueFile<MultipartFile>('image', image)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send($request);
  }

  Future postApiNoAuthenticate(String path, Map<String, dynamic> body) {
    final $url = '${path}';
    final $headers = {'Content-Type': 'application/json'};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send($request);
  }

  Future getAPIWithoutToken(String path) {
    final $url = '${path}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send($request);
  }

  Future getAPIWithPath(String path, String authorization) {
    final $url = '${path}';
    final $headers = {'Authorization': authorization};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send($request);
  }

  Future putAPI(String path, String authorization, Map<String, dynamic> body) {
    final $url = '${path}';
    final $headers = {'Authorization': authorization};
    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send($request);
  }

  Future deleteAPI(String path, String authorization) {
    final $url = '${path}';
    final $headers = {'Authorization': authorization};
    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send($request);
  }

  Future postApiUploadAvatar(
      String path, String authorization, MultipartFile image) {
    final $url = '${path}';
    final $headers = {
      'Authorization': authorization,
      'Content-Type': 'multipart/form-data'
    };
    final $parts = <PartValue>[PartValueFile<MultipartFile>('image', image)];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send($request);
  }

  Future putApi(String path, String authorization, Map<String, dynamic> body) {
    final $url = '${path}';
    final $headers = {
      'Authorization': authorization,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send($request);
  }
}
