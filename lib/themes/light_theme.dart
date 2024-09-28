import 'package:app/themes/colors.dart';
import 'package:app/themes/fonts.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/app_utils.dart';
import 'package:app/utils/dimensions.dart';
import 'package:flutter/material.dart';

ThemeData get LIGHT_THEME {
  return ThemeData(
    cardColor: white,
    useMaterial3: false,
    fontFamily: poppins,
    primaryColor: primary,
    dividerColor: grey2,
    disabledColor: grey2,
    hintColor: grey2,
    indicatorColor: primary,
    primarySwatch: Colors.deepPurple,
    splashColor: transparent,
    focusColor: transparent,
    hoverColor: transparent,
    highlightColor: transparent,
    scaffoldBackgroundColor: offWhite1,
    brightness: Brightness.light,
    visualDensity: VisualDensity.standard,
    colorScheme: _colorScheme,
    tabBarTheme: _tabBarTheme,
    datePickerTheme: _datePickerThemeData,
    elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonTheme),
    outlinedButtonTheme: OutlinedButtonThemeData(style: _outlineButtonTheme),
    textButtonTheme: TextButtonThemeData(style: _textButtonTheme),
    dialogTheme: _dialogThemeData,
    appBarTheme: _appBarTheme,
    radioTheme: _radioThemeLight,
    checkboxTheme: _checkBoxThemeLight,
    buttonTheme: _buttonTheme,
    primaryIconTheme: _primaryIconTheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    bottomAppBarTheme: _bottomAppBarTheme,
    dividerTheme: const DividerThemeData(thickness: 1, space: 1, color: offWhite4),
    sliderTheme: _sliderThemeData,
    bottomSheetTheme: _bottomSheetTheme,
    drawerTheme: _drawerTheme,
  );

  /*return ThemeData(
    drawerTheme: _drawerThemeLight,
    bottomSheetTheme: _bottomSheetThemeLight,
    bottomAppBarTheme: _bottomAppBarThemeLight,
  );*/
}

const _colorScheme = ColorScheme.light(
  primary: primary,
  primaryContainer: white,
  secondaryContainer: dark,
  errorContainer: error,
  onErrorContainer: Color(0XFFEDEFF5),
  onPrimaryContainer: primary,
  onError: error,
);

get _primaryIconTheme => const IconThemeData(color: grey2, size: 24);

get _drawerTheme => const DrawerThemeData(elevation: 0.5, backgroundColor: offWhite1, scrimColor: popupBearer);

get _datePickerThemeData {
  return DatePickerThemeData(
    backgroundColor: white,
    cancelButtonStyle: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(grey4)),
    confirmButtonStyle: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(grey4)),
    weekdayStyle: TextStyles.text15_400.copyWith(color: grey4),
    dayStyle: TextStyles.text15_400.copyWith(color: grey4),
    headerForegroundColor: white,
    headerHelpStyle: TextStyles.text14_400.copyWith(color: white),
  );
}

get _dialogThemeData {
  return DialogTheme(
    elevation: 2,
    iconColor: grey2,
    backgroundColor: offWhite2,
    alignment: Alignment.topCenter,
    titleTextStyle: TextStyles.text20_500.copyWith(color: white),
    contentTextStyle: TextStyles.text14_400.copyWith(color: white),
    shape: RoundedRectangleBorder(borderRadius: DIALOG_RADIUS),
  );
}

get _sliderThemeData {
  return const SliderThemeData(
    trackHeight: 6,
    activeTrackColor: primary,
    inactiveTrackColor: offWhite2,
    disabledActiveTrackColor: offWhite2,
    disabledInactiveTrackColor: offWhite2,

    // activeTickMarkColor: transparent,
    // inactiveTickMarkColor: transparent,
    // disabledActiveTickMarkColor: transparent,
    // disabledInactiveTickMarkColor: transparent,
    thumbColor: primary,
    allowedInteraction: SliderInteraction.slideOnly,
    valueIndicatorTextStyle: TextStyle(color: white, fontSize: 13, height: 1.38, fontWeight: w500, fontFamily: poppins),
    valueIndicatorColor: transparent,
    // disabledThumbColor: transparent,
    // thumbShape: SliderComponentShape.noOverlay,
    showValueIndicator: ShowValueIndicator.always,
    // tickMarkShape: SliderTickMarkShape.noTickMark,
    rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 9),
    rangeTickMarkShape: RoundRangeSliderTickMarkShape(tickMarkRadius: 0),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
    tickMarkShape: RoundSliderTickMarkShape(),
    thumbShape: RoundSliderThumbShape(),
    trackShape: RoundedRectSliderTrackShape(),
    rangeTrackShape: RectangularRangeSliderTrackShape(),
    rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
  );
}

get _bottomSheetTheme {
  return BottomSheetThemeData(
    // elevation: SizeConfig.isMobile ? 3 : 0,
    // modalElevation: SizeConfig.isMobile ? 3 : 0,
    showDragHandle: false,
    // backgroundColor: grey4,
    // modalBackgroundColor: grey4,
    backgroundColor: transparent,
    modalBackgroundColor: transparent,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: SHEET_RADIUS),
  );
}

get _tabBarTheme => TabBarTheme(
      labelColor: grey4,
      unselectedLabelColor: grey2,
      labelStyle: TextStyles.text14_500,
      unselectedLabelStyle: TextStyles.text13_500,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      indicatorColor: primary,
      dividerColor: grey2,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: primary)),
    );

get _appBarTheme {
  return AppBarTheme(
    elevation: 0,
    titleSpacing: 20,
    centerTitle: true,
    toolbarHeight: 60,
    backgroundColor: offWhite1,
    systemOverlayStyle: OVERLAY_STYLE,
    titleTextStyle: TextStyles.text16_500.copyWith(color: grey2),
    toolbarTextStyle: TextStyles.text16_500.copyWith(color: grey2),
    iconTheme: const IconThemeData(color: grey2, size: 24),
    actionsIconTheme: const IconThemeData(color: grey2, size: 24),
  );
}

get _bottomAppBarTheme => const BottomAppBarTheme(color: primary, elevation: 3);

get _bottomNavigationBarTheme {
  return const BottomNavigationBarThemeData(
    elevation: 4,
    backgroundColor: primary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: white,
    unselectedItemColor: offWhite4,
    selectedIconTheme: IconThemeData(size: 24, color: white),
    unselectedIconTheme: IconThemeData(size: 24, color: offWhite4),
    selectedLabelStyle: TextStyle(color: white, fontSize: 14, height: 1.57, fontWeight: w500, fontFamily: poppins),
    unselectedLabelStyle: TextStyle(color: offWhite4, fontSize: 14, height: 1.57, fontWeight: w500, fontFamily: poppins),
    type: BottomNavigationBarType.fixed,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
  );
}

get _checkBoxThemeLight {
  return CheckboxThemeData(
    splashRadius: 4,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    checkColor: WidgetStateProperty.all(white),
    side: const BorderSide(color: offWhite2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(04)),
    visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
    fillColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? primary : transparent),
  );
}

get _radioThemeLight {
  return RadioThemeData(
    splashRadius: 4,
    visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
    fillColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? primary : grey1),
  );
}

get _buttonTheme {
  return ButtonThemeData(
    height: 48,
    minWidth: 50,
    disabledColor: grey2,
    buttonColor: primary,
    focusColor: transparent,
    hoverColor: transparent,
    splashColor: transparent,
    highlightColor: transparent,
    padding: const EdgeInsets.symmetric(horizontal: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}

get _elevatedButtonTheme {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    elevation: 0.5,
    foregroundColor: white,
    backgroundColor: primary,
    disabledForegroundColor: offWhite3,
    disabledBackgroundColor: primary.withOpacity(0.5),
    disabledMouseCursor: MouseCursor.defer,
    visualDensity: VisualDensity.standard,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    textStyle: TextStyles.text15_500.copyWith(color: white),
    side: const BorderSide(color: transparent, width: 0),
    minimumSize: const Size(50, 48),
    maximumSize: const Size(double.infinity, 48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}

get _outlineButtonTheme {
  return OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    elevation: 0.5,
    shadowColor: transparent,
    foregroundColor: offWhite3,
    backgroundColor: transparent,
    disabledForegroundColor: offWhite3,
    disabledBackgroundColor: transparent,
    enabledMouseCursor: MouseCursor.uncontrolled,
    disabledMouseCursor: MouseCursor.defer,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    textStyle: TextStyles.text15_500.copyWith(color: white),
    minimumSize: const Size(50, 48),
    maximumSize: const Size(double.infinity, 48),
    side: const BorderSide(color: offWhite4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    visualDensity: VisualDensity.standard,
  );
}

get _textButtonTheme {
  return TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    elevation: 0.5,
    shadowColor: transparent,
    foregroundColor: offWhite3,
    backgroundColor: transparent,
    visualDensity: VisualDensity.standard,
    textStyle: TextStyles.text15_500.copyWith(color: dark),
  );
}

get _floatingActionButtonTheme {
  return FloatingActionButtonThemeData(
    elevation: 3,
    iconSize: 24,
    backgroundColor: primary,
    foregroundColor: white,
    hoverColor: transparent,
    splashColor: transparent,
    focusColor: transparent,
    disabledElevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  );
}
