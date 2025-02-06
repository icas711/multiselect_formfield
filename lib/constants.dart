import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff416AF0);
const kSelectedColor = Color(0xFF156e50);
const kTextColor = Color(0xFF3C4046);
const kTextSecondaryColor = Color(0xFF416AF0);
const kBackgroundColor = Color(0xFFF7F6FC);
const kFontWeight = FontWeight.w300;
const double kDefaultPadding = 20;

///AlertDialog
const kAlertDialogBackgroundTitleColor = Color(0xff416AF0);
const kAlertDialogForegroundTitleColor = Color(0xFFFFFFFF);
const kAlertDialogBackgroundColor = Color(0xFFF3F2F7);
const kAlertDialogBorderRadius = 20.0;

const kListSelectedColor = Color(0xFFcccccc);

///AppBar
const kAppBarBackgroundColor = Color(0xFFE2E4E7);
const kAppBarForegroundColor = Color(0xFF416AF0);

///Navigation Bar and Rails
const kBarAndRailBackgroundColor = Color(0xFF416AF0);
const kSelectedBarColor = Colors.greenAccent;
const kBarColor = Colors.white;
const kBarColorOpacity = Color(0x60ffffff);

///Buttons
const kIconButtonBackgroundColor = Color(0x3C763E8D);
const kElevatedButtonBackgroundColor = Color(0xFF416AF0);
const kElevatedButtonForegroundColor = Color(0xFFF7F6FC);

///DropdowMenu
const kDropdownMenuBorder = Color(0xFFF2F5F7);
const kDropdownMenuFillBackground = Color(0xFFFFFFFF);
const kDropdownMenuBorderRadius = BorderRadius.all(Radius.circular(10));
const kDropdownMenuColorLabel = Color(0xFF000000);

const kUserBubbleColor = Color(0x80b6f1f1);
const kAIBubbleColor = Color(0x50ffffff);
const kTableSelected = Color(0xFFEDF2FF);
const kTableHovered = Color(0xFFDDE6FC);
const kAuthBox = 'auth_box';

mixin ThemeText {
  static const TextStyle cellText = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400);
}
