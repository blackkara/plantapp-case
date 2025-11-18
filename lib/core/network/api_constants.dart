class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app';
  static const String categoriesEndpoint = '/getCategories';
  static const String questionsEndpoint = '/getQuestions';

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
