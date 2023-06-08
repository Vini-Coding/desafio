import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_validator/app/home/components/add_edit/criteria_row.dart';
import 'package:password_validator/app/home/controller/add_edit_controller.dart';

class AddEditPopUpWidget extends StatefulWidget {
  const AddEditPopUpWidget({
    required this.title,
    required this.buttonPrompt,
    required this.onDone,
    required this.isAdd,
    this.password,
    super.key,
  });
  final String title;
  final String buttonPrompt;
  final String? password;
  final Function(String password) onDone;
  final bool isAdd;

  @override
  State<AddEditPopUpWidget> createState() => _AddEditPopUpWidgetState();
}

class _AddEditPopUpWidgetState extends State<AddEditPopUpWidget> {
  AddEditController controller = AddEditController();

  @override
  void initState() {
    super.initState();
    controller.passwordTextController.text = widget.password ?? "";
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: textTheme.displayMedium,
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.x,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Recomendamos que a senha siga os critérios abaixo",
                  style: textTheme.bodySmall!.copyWith(
                    color: const Color(0xFF696969),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 25),
                ValueListenableBuilder(
                  valueListenable: controller.isPasswordVisible,
                  builder: (context, isPasswordVisible, child) {
                    return TextField(
                      obscureText: !controller.isPasswordVisible.value,
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                        color: colorScheme.primary,
                      ),
                      controller: controller.passwordTextController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: colorScheme.onBackground,
                          ),
                        ),
                        hintText: "Digite a senha...",
                        hintStyle: textTheme.bodyMedium!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        suffixIcon: IconButton(
                          iconSize: 20,
                          onPressed: controller.changePasswordVisibility,
                          icon: controller.isPasswordVisible.value
                              ? FaIcon(
                                  FontAwesomeIcons.eye,
                                  color: colorScheme.primary,
                                )
                              : FaIcon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: colorScheme.primary,
                                ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 25),
                CriteriaRow(
                  criteria: "Mínimo de 7 caracteres",
                  criteriaValidation: controller.minimalSevenCaracters,
                ),
                CriteriaRow(
                  criteria: "Mínimo de 1 caractere maiúsculo",
                  criteriaValidation: controller.upperCaseCaracter,
                ),
                CriteriaRow(
                  criteria: "Mínimo de 1 caractere minúsculo",
                  criteriaValidation: controller.lowerCaseCaracter,
                ),
                CriteriaRow(
                  criteria: "Mínimo de 1 caractere numérico",
                  criteriaValidation: controller.minimalOneNumber,
                ),
                CriteriaRow(
                  criteria: "Mínimo de 1 caractere especial",
                  criteriaValidation: controller.minimalOneSpecialCaracter,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.onDone(controller.passwordTextController.text);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              dismissDirection: DismissDirection.horizontal,
                              content: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: widget.isAdd
                                      ? Colors.green
                                      : colorScheme.secondary,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20),
                                      child: FaIcon(
                                        widget.isAdd
                                            ? FontAwesomeIcons.circlePlus
                                            : FontAwesomeIcons.pencil,
                                        color: colorScheme.background,
                                      ),
                                    ),
                                    //const SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        widget.isAdd
                                            ? "Senha ${controller.passwordTextController.text} adicionada com sucesso"
                                            : "Senha ${widget.password} alterada com sucesso",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              behavior: SnackBarBehavior.fixed,
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: controller.isPasswordStrong
                                ? Colors.green
                                : colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.buttonPrompt,
                            style: textTheme.displaySmall!.copyWith(
                              color: colorScheme.background,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
