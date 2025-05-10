enum ImageType {
  userProfile,
  feedbackScreenshot,
  misc,
}

extension ImageTypeConfig on ImageType {
  String get pathSegment {
    switch (this) {
      case ImageType.userProfile:
        return 'profile';
      case ImageType.feedbackScreenshot:
        return 'feedback';
      case ImageType.misc:
        return 'misc';
    }
  }

  ({int? width, int? height, double? quality}) get resizeConfig {
    switch (this) {
      case ImageType.userProfile:
        return (width: 120, height: 120, quality: 0.9);
      case ImageType.feedbackScreenshot:
      case ImageType.misc:
        return (width: null, height: null, quality: 0.8);
    }
  }
}
