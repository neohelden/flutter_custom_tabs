import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// Option class for customizing appearance of Custom Tabs.
/// **This option applies only on Android platform.**
///
/// See also:
///
/// * [CustomTabsIntent.Builder](https://developer.android.com/reference/android/support/customtabs/CustomTabsIntent.Builder.html)
///
class CustomTabsOption {
  /// Custom tab toolbar color.
  final Color toolbarColor;

  /// If enabled, hides the toolbar when the user scrolls down the page.
  final bool enableUrlBarHiding;

  /// If enabled, default sharing menu is added.
  final bool enableDefaultShare;

  /// Show web page title in tool bar.
  final bool showPageTitle;

  ///  Enter and exit animation.
  final CustomTabsAnimation animation;

  const CustomTabsOption({
    this.toolbarColor,
    this.enableUrlBarHiding,
    this.enableDefaultShare,
    this.showPageTitle,
    this.animation,
  });

  Map<String, dynamic> toMap() {
    final dest = new Map<String, dynamic>();
    if (toolbarColor != null) {
      dest['toolbarColor'] = "#${toolbarColor.value.toRadixString(16)}";
    }
    if (enableUrlBarHiding != null) {
      dest['enableUrlBarHiding'] = enableUrlBarHiding;
    }
    if (enableDefaultShare != null) {
      dest['enableDefaultShare'] = enableDefaultShare;
    }
    if (showPageTitle != null) {
      dest['showPageTitle'] = showPageTitle;
    }

    if (animation != null) {
      dest['animations'] = <String, String>{
        'startEnter': animation.startEnter,
        'startExit': animation.startExit,
        'endEnter': animation.endEnter,
        'endExit': animation.endExit,
      };
    }
    return dest;
  }
}

/// Enter and exit animation for Custom Tabs.
/// **This animation applies only on Android platform.**
///
/// An animation specification is as follows:
/// * For application resources, only resource name.
///  * e.g. `slide_in_right`
/// * Otherwise a resource identifier and type `anim` fixed..
///  * e.g. `android:anim/fade_in`
///
/// See also:
///
/// * https://developer.android.com/reference/android/content/res/Resources.html#getIdentifier(java.lang.String,%20java.lang.String,%20java.lang.String)
///
class CustomTabsAnimation {
  static CustomTabsAnimation _slideIn;

  static CustomTabsAnimation _fade;

  /// Enter animation for the custom tab.
  final String startEnter;

  /// Exit animation for the application.
  final String startExit;

  /// Enter animation for the application.
  final String endEnter;

  /// Exit animation for the custom tab.
  final String endExit;

  const CustomTabsAnimation({
    @required this.startEnter,
    @required this.startExit,
    @required this.endEnter,
    @required this.endExit,
  })  : assert(startEnter != null),
        assert(startExit != null),
        assert(endEnter != null),
        assert(endExit != null);

  /// Create a built-in slide in animation.
  factory CustomTabsAnimation.slideIn() {
    if (_slideIn == null) {
      _slideIn = const CustomTabsAnimation(
        startEnter: 'slide_in_right',
        startExit: 'slide_out_left',
        endEnter: 'android:anim/slide_in_left',
        endExit: 'android:anim/slide_out_right',
      );
    }
    return _slideIn;
  }

  /// Create a built-in fade animation.
  factory CustomTabsAnimation.fade() {
    if (_fade == null) {
      _fade = const CustomTabsAnimation(
        startEnter: 'android:anim/fade_in',
        startExit: 'android:anim/fade_out',
        endEnter: 'android:anim/fade_out',
        endExit: 'android:anim/fade_in',
      );
    }
    return _fade;
  }
}