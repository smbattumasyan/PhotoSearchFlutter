import 'package:http/http.dart' as http;

enum UnsplashAPI {
  searchPhotos
}

class UnsplashAPIService {
  final String baseUrl = "https://api.unsplash.com";
  final String clientId = "UbU4uh5CWpPXyLO9cv7M0rJaRnMuPx52NLRLVuQdD44";

  String getPath(UnsplashAPI endpoint) {
    switch (endpoint) {
      case UnsplashAPI.searchPhotos:
        return "/search/photos";
      default:
        return "";
    }
  }

  String getMethod(UnsplashAPI endpoint) {
    switch (endpoint) {
      case UnsplashAPI.searchPhotos:
        return "GET";
      default:
        return "GET";
    }
  }

  Map<String, String> getParameters(UnsplashAPI endpoint, {String? query, int? page, int? perPage}) {
    switch (endpoint) {
      case UnsplashAPI.searchPhotos:
        return {
          "query": query ?? "",
          "page": page?.toString() ?? "1",
          "per_page": perPage?.toString() ?? "10",
          "client_id": clientId
        };
      default:
        return {};
    }
  }

  Uri buildUri(UnsplashAPI endpoint, {String? query, int? page, int? perPage}) {
    final path = getPath(endpoint);
    final parameters = getParameters(endpoint, query: query, page: page, perPage: perPage);
    return Uri.parse(baseUrl).replace(path: path, queryParameters: parameters);
  }

  Future<http.Response> getRequest(UnsplashAPI endpoint, {String? query, int? page, int? perPage}) async {
    final uri = buildUri(endpoint, query: query, page: page, perPage: perPage);
    final response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw Exception('Failed request: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}

// void main() async {
//   final apiService = UnsplashAPIService();
//   try {
//     final response = await apiService.getRequest(UnsplashAPI.searchPhotos, query: "nature", page: 1, perPage: 10);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print(data);
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//   }
// }
