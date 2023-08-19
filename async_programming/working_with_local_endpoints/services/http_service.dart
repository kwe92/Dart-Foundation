// ignore_for_file: unused_catch_stack

import 'package:http/http.dart' as http;

mixin HttpService {
  static final _httpSocketError =
      http.Response('{"socket_exception":"Unable to communicate with server. Check your internet connection."}', 550);

  String get host;

  Map<String, String> get headers;

  Future<http.Response> get(
    String endpoint, {
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(tempHost ?? host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
      );

      return response;
    } catch (error, stackTrace) {
      print('Error:\n\n${error.toString()}');
      return _httpSocketError;
    }
  }

  // TODO: continue implementing post request function
  Future<http.Response> post(
    String endpoint, {
    required dynamic body,
    String? tempHost,
    Map<String, String>? baseHeaders,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      // TODO: continue implementation  | remove place holder response
      return http.Response("place holder response.", 9999);
    } catch (error, stackTrace) {
      print("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }
}

// TODO: continue implementing parse status code

void parseStatusCode() {}

// TODO: Comment your code!

// What is a Service?

//   - Services aslo referred to as repositories request responses from
//     server endpoints
//   - the response is then decoded and servered throughout your application
//   - Services can also be used to serve temporary data throughtout your application
//     like a ToastService that displays temporary snack bars and banners
 
