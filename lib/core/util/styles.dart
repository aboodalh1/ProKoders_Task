import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle allertaStencilNormal15(BuildContext context) {
    return GoogleFonts.allertaStencil(
      fontSize: getResponsiveFontSize(baseFontSize: 15, context: context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle allertaStencilSemiBold15(BuildContext context) {
    return GoogleFonts.allertaStencil(
      fontSize: getResponsiveFontSize(baseFontSize: 15, context: context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle allertaStencilSemiBold25(BuildContext context) {
    return GoogleFonts.allertaStencil(
      fontSize: getResponsiveFontSize(baseFontSize: 25, context: context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle interMedium20(BuildContext context) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(baseFontSize: 20, context: context),
    );
  }

  static TextStyle interNormal20(BuildContext context) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(baseFontSize: 20, context: context),
    );
  }
}

double getResponsiveFontSize({
  required double baseFontSize,
  required BuildContext context,
}) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  double textScaleFactor = mediaQuery.textScaleFactor;

  return baseFontSize / textScaleFactor;
}
