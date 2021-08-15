import 'package:http/http.dart' as http;

Uri buildUrl(String subUrl, [Map<String, String> queryParams]) {
  return Uri.https("flock-follow.live", "/api/v1/$subUrl", queryParams);
}

Future<String> httpGet(String subUrl, [Map<String, String> queryParams]) async {
  final response = await http.get(buildUrl(subUrl, queryParams));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to GET data');
  }
}

Future<String> httpPost(String subUrl, data) async {
  final response = await http.post(buildUrl(subUrl),
    headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
    body: data,
  );
  if ([200, 201, 204].contains(response.statusCode)) {
    return response.body;
  } else {
    throw Exception('Failed to POST data');
  }
}

Future<String> httpPut(String subUrl, data) async {
  final response = await http.put(buildUrl(subUrl),
    headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
    body: data,
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to PUT data');
  }
}

Future<String> httpDelete(String subUrl) async {
  final response = await http.delete(buildUrl(subUrl));
  if ([200, 204].contains(response.statusCode)) {
    return response.body;
  } else {
    throw Exception('Failed to DELETE data');
  }
}
