class HttpConfig {
  static const DOMAIN = 'appstore.dotorimarket.com';
  // static const DOMAIN = 'localhost:3000';
  static const URL_PREFIX = 'https://$DOMAIN';
  // static const URL_PREFIX = 'http://$DOMAIN';
  static const URL_WEB_SOCKET_PREFIX = 'ws://$DOMAIN';
  static const URL_MOBILE_PREFIX = '$URL_PREFIX/api/mobile';
  static const URL_FILE_PREFIX = '$URL_PREFIX/upload';
}