import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BusinessCardReaderEndPointCall {
  static Future<ApiCallResponse> call({
    String? imageByte = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "imageData": "$imageByte"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BusinessCardReaderEndPoint',
      apiUrl: 'https://rainconnect-cool-api.onrender.com/decrypt-bcr',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.city''',
      ));
  static String? company(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.company_name''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.country''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.email''',
      ));
  static String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.first_name''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.last_name''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.phone_number''',
      ));
  static String? positionRole(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.result.data.position_role''',
      ));
  static String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.street''',
      ));
  static String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.website''',
      ));
  static String? zipCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.data.zip_code''',
      ));
}

class TranscribeAudioCall {
  static Future<ApiCallResponse> call({
    String? file = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'transcribeAudio',
      apiUrl: 'https://api.openai.com/v1/audio/transcriptions/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
        'model': "whisper-1",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

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
