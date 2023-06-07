import 'package:flutter/material.dart';
import 'package:password_validator/app/home/controller/home_controller.dart';
import 'package:password_validator/app/home/enum/filter_list_by.dart';

class PasswordsFilterWidget extends StatefulWidget {
  const PasswordsFilterWidget({
    required this.isSelected,
    required this.controller,
    super.key,
  });
  final List<bool> isSelected;
  final HomeController controller;

  @override
  State<PasswordsFilterWidget> createState() => _PasswordsFilterWidgetState();
}

class _PasswordsFilterWidgetState extends State<PasswordsFilterWidget> {
  late HomeController controller = widget.controller;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        child: ToggleButtons(
          isSelected: widget.isSelected,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          borderWidth: 3,
          selectedColor: colorScheme.background,
          selectedBorderColor: colorScheme.background,
          borderColor: colorScheme.background,
          fillColor: colorScheme.secondary,
          color: colorScheme.background,
          textStyle: textTheme.displaySmall,
          highlightColor: colorScheme.secondary,
          constraints: BoxConstraints(
            minHeight: 40,
            minWidth: ((MediaQuery.of(context).size.width / 3) - 15),
          ),
          onPressed: (newIndex) {
            setState(
              () {
                for (int i = 0; i < widget.isSelected.length; i++) {
                  widget.isSelected[i] = i == newIndex;
                }
                switch (newIndex) {
                  case 0:
                    controller.filterList(FilterListBy.allPasswords);
                    break;
                  case 1:
                    controller.filterList(FilterListBy.weakPasswords);
                    break;
                  case 2:
                    controller.filterList(FilterListBy.strongPasswords);
                    break;
                  default:
                    controller.filterList(FilterListBy.allPasswords);
                    break;
                }
              },
            );
          },
          children: const [
            Text("TODAS"),
            Text("FRACAS"),
            Text("FORTES"),
          ],
        ),
      ),
    );
  }
}
