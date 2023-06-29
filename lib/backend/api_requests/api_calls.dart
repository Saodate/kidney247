import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ChatGPT Group Code

class ChatGPTGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? prompt = '',
  }) {
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "You are a kidney disease expert, who will answer questions in a calm and funny manner. If the user asks a question that is not related to kidney disease, you will say: I am not sure I can help you with that question. If question is Vietnamese, answer in Vietnamese, else if question is English, answer in English, only answer one language."
    },
    {
      "role": "user",
      "content": "${prompt}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${ChatGPTGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        ...ChatGPTGroup.headers,
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic createdTimestamp(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.role''',
      );
  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

/// End ChatGPT Group Code

class SelectMealCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? appKey = '',
    String? query = '',
  }) {
    final body = '''
{
  "query": "${query}",
  "timezone": "US/Eastern"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'selectMeal',
      apiUrl: 'https://trackapi.nutritionix.com/v2/natural/nutrients',
      callType: ApiCallType.POST,
      headers: {
        'x-app-id': '${appId}',
        'x-app-key': '${appKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].food_name''',
      );
  static dynamic qty(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].serving_qty''',
      );
  static dynamic unit(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].serving_unit''',
      );
  static dynamic calories(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].nf_calories''',
      );
  static dynamic sodium(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].nf_sodium''',
      );
  static dynamic protein(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].nf_protein''',
      );
  static dynamic potassium(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].nf_potassium''',
      );
  static dynamic phosphorus(dynamic response) => getJsonField(
        response,
        r'''$..full_nutrients[?(@.attr_id ==305)].value''',
      );
  static dynamic photo(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].photo.highres''',
      );
  static dynamic fluid(dynamic response) => getJsonField(
        response,
        r'''$..full_nutrients[?(@.attr_id ==255)].value''',
      );
  static dynamic gram(dynamic response) => getJsonField(
        response,
        r'''$.foods[0].serving_weight_grams''',
      );
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
