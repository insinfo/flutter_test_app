class AppConfig {
  static String userAgent = 'appjubarte';
  static String protocol = 'https';
  static String host = 'appro.riodasostras.rj.gov.br';
  static String basePath = '/riodasostrasapp_server/api';
  static String baseUrl = '$protocol://$host$basePath';
  static Map<String, String> headersDefault = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  static String postsApiEndpoint = '/posts';
}
