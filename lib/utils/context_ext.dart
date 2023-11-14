import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
  void push(Widget widget) => Navigator.push(
        this,
        MaterialPageRoute(builder: (context) => widget),
      );
  void pushReplacement(Widget widget) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(builder: (context) => widget),
      );
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  void popAndPushNamed(String routeName, {Object? arguments}) =>
      Navigator.popAndPushNamed(this, routeName, arguments: arguments);
  void popTrue() => Navigator.of(this).pop(true);
  void popFalse() => Navigator.of(this).pop(false);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaQueryPadding => mediaQuery.padding;
  EdgeInsets get mediaQueryViewPadding => mediaQuery.viewPadding;
  EdgeInsets get mediaQueryViewInsets => mediaQuery.viewInsets;

  Orientation get orientation => mediaQuery.orientation;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  double get textScaleFactor => mediaQuery.textScaleFactor;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  bool get isPhone => (mediaQueryShortestSide < 600);
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);
  bool get isTablet => isSmallTablet || isLargeTablet;

  Size get mediaQuerySize => mediaQuery.size;
  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  bool get isDark => (theme.brightness == Brightness.dark);

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  // DefaultAssetBundle.of(context).loadString('pizzalist.json'),
  AssetBundle get assetBundle => DefaultAssetBundle.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void unFocusKeyBoard() {
    if (!focusScope.hasPrimaryFocus) focusScope.unfocus();
  }

  Future showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          String message) =>
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          // backgroundColor: primary,
        ),
      );
}
