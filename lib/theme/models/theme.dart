import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class LightTheme {
  static get make => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryLight,
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColors.whiteBg,
          elevation: 0,
          toolbarHeight: 40.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            color: AppColors.primaryLight,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
          iconTheme: IconThemeData(
            color: AppColors.primaryLight,
            size: 36.0,
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 38.0,
            color: AppColors.primaryLight,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            //letterSpacing: 1.2,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
          ),
          labelLarge: TextStyle(
            color: AppColors.gray,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            backgroundColor: AppColors.primaryLight,
            textStyle: const TextStyle(
              color: AppColors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
