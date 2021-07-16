import 'dart:html';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;
  AdState(this.initialization);
  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-1794462625745415/4294479714'
      : 'ca-app-pub-1794462625745415/5136788093';
}
