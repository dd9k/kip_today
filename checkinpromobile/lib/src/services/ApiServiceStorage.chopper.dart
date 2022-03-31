// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiServiceStorage.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiServiceStorage extends ApiServiceStorage {
  _$ApiServiceStorage([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiServiceStorage;

  Future getImage(String path) {
    final $url = '${path}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send($request);
  }
}
