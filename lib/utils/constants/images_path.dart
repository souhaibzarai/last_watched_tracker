class ImagesPath {
  ImagesPath._();

  static const String _splashImageName = 'splash';
  static const String _defaultImg = 'default';
  static const String _imageMainFolderPathName = 'images';
  static const String _imgExt = '.png';

  static const String splashImage = 'assets/splash/$_splashImageName$_imgExt';

  static const String emailSent =
      'assets/$_imageMainFolderPathName/email_sent$_imgExt';

  static const String logo = 'assets/$_imageMainFolderPathName/logo$_imgExt';

  static const String defaultImg =
      'assets/$_imageMainFolderPathName/$_defaultImg$_imgExt';

  static const String successImage =
      'assets/$_imageMainFolderPathName/success$_imgExt';
}
