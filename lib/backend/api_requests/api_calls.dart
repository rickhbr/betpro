import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Hackeando Group Code

class HackeandoGroup {
  static String baseUrl = 'https://api.scrapingcasinos.com/Evolution/Rodadas/';
  static Map<String, String> headers = {};
  static BacBoCall bacBoCall = BacBoCall();
  static DragonTigerCall dragonTigerCall = DragonTigerCall();
  static FutCall futCall = FutCall();
  static ExtremeCall extremeCall = ExtremeCall();
}

class BacBoCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Bac Bo',
      apiUrl: '${HackeandoGroup.baseUrl}BacBo00000000001.txt',
      callType: ApiCallType.GET,
      headers: {
        ...HackeandoGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DragonTigerCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Dragon Tiger',
      apiUrl: '${HackeandoGroup.baseUrl}DragonTiger00001.txt',
      callType: ApiCallType.GET,
      headers: {
        ...HackeandoGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FutCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Fut',
      apiUrl: '${HackeandoGroup.baseUrl}TopCard000000001.txt',
      callType: ApiCallType.GET,
      headers: {
        ...HackeandoGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ExtremeCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Extreme',
      apiUrl: '${HackeandoGroup.baseUrl}XxxtremeLigh0001.txt',
      callType: ApiCallType.GET,
      headers: {
        ...HackeandoGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Hackeando Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
