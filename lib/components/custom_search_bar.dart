import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final Widget? suffixIcon;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.search,
        border: InputBorder.none,
        suffixIcon: suffixIcon,
      ),
      autofocus: true,
      onChanged: onChanged,
    );
  }
}
