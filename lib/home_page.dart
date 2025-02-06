import 'package:flutter/material.dart';
import 'package:multiselect_formfield/di_container.dart';
import 'package:multiselect_formfield/model/selector_provider.dart';
import 'package:multiselect_formfield/model/user.dart';
import 'package:multiselect_formfield/widgets/multiselect_formfield.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectorProvider>(
      create: (context)=>SelectorProvider(),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: Container(
          decoration: BoxDecoration(
            color: kDropdownMenuFillBackground,
            borderRadius: kDropdownMenuBorderRadius,
            border: Border.all(color: kDropdownMenuBorder),
          ),
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: MultiSelectFormField<User>(
            chipBackGroundColor: Colors.transparent,
            chipLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: kTextColor),
            dialogTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            activeColor: kListSelectedColor,
            checkColor: Colors.transparent,
            dataSource: diContainer.users,
            hintWidget: const Text(
              'Нажмите...',
              style: ThemeText.cellText,
            ),
          ),
        ),
      ),
    );
  }
}