import 'package:http/http.dart' as http;

const BaseUrl = "http://10.0.2.2:8000/api/v1";

Future<String> httpGet(String url) async {
  final response = await http.get(BaseUrl + url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<String> httpPost(String url, data) async {
  final response = await http.post(BaseUrl + url,
    headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
    body: data,
  );
  if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
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
    throw Exception('Failed to load data');
  }
}
