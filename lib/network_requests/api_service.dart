class ApiService {
  static const String apiKey =
      String.fromEnvironment('API_KEY', defaultValue: '');
  final String _statsUrl = "https://disease.sh/v2/";
  final String _query = "q=covid%2019%20vaccine";

  String get query => _query;
  String get statsUrl => _statsUrl;
}
