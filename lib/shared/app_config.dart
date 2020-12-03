class AppConfig {
  static String userAgent = 'appjubarte';
  static String protocol = 'https';
  static String host = 'appro.riodasostras.rj.gov.br';
  static String basePath = '/riodasostrasapp_server/api';
  static const radioUrl = "https://www.riodasostras.rj.gov.br/radio-teste";
  static const coronaVirusUrl = 'https://www.riodasostras.rj.gov.br/coronavirus/#boletim';
  static const politicaUrl =
      'https://www.riodasostras.rj.gov.br/app-rio-das-ostras-app-termo-e-politica-de-privacidade/';

  static const topoSiteImageUrl =
      'https://www.riodasostras.rj.gov.br/wp-content/uploads/2019/02/background-topo-experimente3.jpg';
  //https://appro.riodasostras.rj.gov.br/riodasostrasapp_server/api/posts
  static String baseUrl = '$protocol://$host$basePath';
  static Map<String, String> headersDefault = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  static String postsApiEndpoint = '/posts';
  static String jornaisApiEndpoint = '/jornais';
  static String orgaosApiEndpoint = '/orgaos';
  static String midiasApiEndpoint = '/midias';
  static String podcastsApiEndpoint = '/podcasts';
  static String usuariosApiEndpoint = '/usuarios';

  static String loginApiEndpoint = '/auth/login';
  static String validateqrcodeApiEndpoint = '/auth/validateqrcode';
}
