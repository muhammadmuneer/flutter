import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const primaryColor = Color(0xFF7a4c6d);
  static const secondary = Color(0xFFd5983a);
  static const thirdColor = Color(0xFFad1fa8);
  static const backColor = Color(0xFFF4F4F4);

  static final Color? _errorColor = Colors.red[600];

  static ThemeData data() => ThemeData(
        primaryColor: primaryColor,
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFFFD7F1),
          onPrimaryContainer: Color(0xFF3A0032),
          secondary: secondary,
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFFFDDAF),
          onSecondaryContainer: Color(0xFF2A1800),
          tertiary: Color(0xFFA615A2),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFD6F6),
          onTertiaryContainer: Color(0xFF380038),
          error: Color(0xFFB3261E),
          errorContainer: Color(0xFFF9DEDC),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410E0B),
          background: Color(0xFFFFFBFE),
          onBackground: Color(0xFF1C1B1F),
          surface: Color(0xFFFFFBFE),
          onSurface: Color(0xFF1C1B1F),
          surfaceVariant: Color(0xFFE7E0EC),
          onSurfaceVariant: Color(0xFF49454F),
          outline: Color(0xFF79747E),
          onInverseSurface: Color(0xFFF4EFF4),
          inverseSurface: Color(0xFF313033),
          inversePrimary: Color(0xFFFFACE9),
          shadow: Color(0xFF000000),
        ),
        appBarTheme: _appBarTheme(),
        textTheme: _textTheme(),
        tabBarTheme: _tabBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        popupMenuTheme: _popUpMenuThemeData(),
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
        backgroundColor: Colors.white,
        errorColor: _errorColor,
        cardColor: const Color(0xFFF5F7F9),
        splashColor: Colors.blueGrey[100]!.withOpacity(.05),
        highlightColor: Colors.blueGrey[200]!.withOpacity(.25),
        dividerColor: const Color(0xFFD3D3D3),
        cupertinoOverrideTheme: _cupertinoOverrideTheme(),
        textSelectionTheme: _textSelectionTheme(),
        textButtonTheme: _textButtonTheme(),
        scrollbarTheme: _scrollbarTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
        canvasColor:
            Colors.transparent, //This is necessary for bottomSheet to work.
      );

  static AppBarTheme _appBarTheme() => const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryColor,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: primaryColor,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      );

  static TextTheme _textTheme() => const TextTheme(
        headline1: TextStyle(
            height: 1.0,
            fontSize: 96,
            color: Colors.white,
            letterSpacing: -1.5,
            fontFamily: "Inter",
            fontWeight: FontWeight.normal),
        headline2: TextStyle(
          height: 1.2,
          fontSize: 60,
          color: Colors.black,
          letterSpacing: -0.5,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          height: 1.2,
          fontSize: 48,
          letterSpacing: 0,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        headline4: TextStyle(
          height: 1.2,
          fontSize: 34,
          letterSpacing: 0.25,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          height: 1.2,
          fontSize: 24,
          letterSpacing: 0,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        headline6: TextStyle(
          height: 1.2,
          fontSize: 20,
          letterSpacing: 0.15,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          letterSpacing: 0.15,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          letterSpacing: 0.1,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        bodyText2: TextStyle(
          fontSize: 13,
          letterSpacing: 0.25,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        button: TextStyle(
          fontSize: 14,
          letterSpacing: 1.25,
          color: Colors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          fontSize: 12,
          letterSpacing: 0.4,
          color: Colors.grey,
          fontFamily: "Inter",
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
      );

  static TabBarTheme _tabBarTheme() => TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "Inter",
          color: Colors.grey[500],
          fontWeight: FontWeight.w600,
        ),
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: primaryColor, width: 4),
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        errorStyle: TextStyle(
          color: _errorColor,
          fontSize: 13,
          fontFamily: 'Inter',
        ),
        border: OutlineInputBorder(
          // borderSide: const BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
          fontFamily: 'Inter',
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      );

  static CupertinoThemeData _cupertinoOverrideTheme() =>
      const CupertinoThemeData(
        primaryColor: primaryColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: primaryColor,
          actionTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  static ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(
          Colors.white70,
        ),
      );

  static PopupMenuThemeData _popUpMenuThemeData() => PopupMenuThemeData(
        elevation: 15,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: "Inter",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey[300]!,
            width: 2,
          ),
        ),
      );

  static TextSelectionThemeData _textSelectionTheme() => TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionHandleColor: primaryColor,
        selectionColor: secondary.withOpacity(.1),
      );

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          textStyle: _textTheme().button,
          minimumSize: const Size(
            double.infinity, //sizeConfig.width(.85),
            55, //sizeConfig.height(.06),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          animationDuration: const Duration(milliseconds: 250),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2.0, color: secondary),
        ),
      );
}
