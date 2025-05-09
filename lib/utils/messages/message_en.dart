class CommonMessagesEn {
  static const String accountCreated = 'Account created successfully';
  static const String passwordTooWeak = 'The provided password is too weak';
  static const String emailAlreadyUsed = 'The email address is already in use';
  static const String invalidCredentials = 'Invalid email or password';
  static const String passwordResetLinkSent =
      'Password reset link has been sent to your email';
  static const String operationFailed =
      'Operation failed. Please try again later';
  static const String notAuthenticated = 'User is not authenticated';
  static const String somethingWentWrong = 'An error occurred';
  static const String noImageSelected = 'No image selected';
  static const String imageUploadFailed = 'Image upload failed';
  static const String invalidParameter = 'Invalid parameter provided';
  static const String missingUserConnectionParams =
      'User connection parameters are missing';
  static const String missingUserCreationParams =
      'User creation parameters cannot be null';

  static const String mediaCreated = 'Media created successfully';
  static const String missingMediaCreationParams =
      'Media creation parameters cannot be null';
  static const String mediaListEmpty = 'Your media list is currently empty.';
  static const String archivedListEmpty = 'The archive is currently empty.';
  static const String mediaArchived =
      'The media has been archived successfully.';
  static const String mediaDeleted = 'The media has been deleted successfully.';
  static const String errorOnArchive =
      'An error occurred while archiving the item';
  static const String mediaWillStayArchived =
      'This media will stay archived unless you unarchive it.';

  static String confirmMediaDeletion(String mediaTitle) {
    return 'Are you sure you want to permanently delete "$mediaTitle" from your list?';
  }
}
