import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_validator/app/home/controller/home_controller.dart';
import 'package:password_validator/app/shared/utils/password_validation.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    required this.textPassword,
    required this.editFunction,
    required this.deleteFunction,
    required this.controller,
    super.key,
  });
  final String textPassword;
  final Function() editFunction;
  final Function() deleteFunction;
  final HomeController controller;

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late HomeController controller = widget.controller;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 50,
          width: double.maxFinite,
          child: Row(
            children: [
              Container(
                color: validateAllCriteria(widget.textPassword)
                    ? colorScheme.primary
                    : colorScheme.secondary,
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  color: colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.textPassword,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: widget.editFunction,
                child: Container(
                  height: 50,
                  width: 50,
                  color: colorScheme.secondary,
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.pencil,
                    color: colorScheme.background,
                    size: 22,
                  ),
                ),
              ),
              InkWell(
                onTap: widget.deleteFunction,
                child: Container(
                  height: 50,
                  width: 50,
                  color: colorScheme.primary,
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    color: colorScheme.background,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
