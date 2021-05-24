import 'package:http/http.dart' as http;

const BaseUrl = "http://10.0.2.2:8000/api/v1";

Future<String> httpGet(String url) async {
  final response = await http.get(BaseUrl + url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to GET data');
  }
}

Future<String> httpPost(String url, data) async {
  final response = await http.post(BaseUrl + url,
    headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
    body: data,
  );
  if ([200, 201, 204].contains(response.statusCode)) {
    return response.body;
  } else {
    throw Exception('Failed to POST data');
  }
}

Future<String> httpPut(String url, data) async {
  final response = await http.put(BaseUrl + url,
    headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
    body: data,
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to PUT data');
  }
}

Future<String> httpDelete(String url) async {
  final response = await http.delete(BaseUrl + url);
  if ([200, 204].contains(response.statusCode)) {
    return response.body;
  } else {
    throw Exception('Failed to DELETE data');
  }
}
