import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeletePopUp extends StatefulWidget {
  const DeletePopUp({
    required this.password,
    required this.delete,
    super.key,
  });
  final String password;
  final Function() delete;

  @override
  State<DeletePopUp> createState() => _DeletePopUpState();
}

class _DeletePopUpState extends State<DeletePopUp> {
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
                Text(
                  "DELETAR SENHA",
                  style: textTheme.displayMedium,
                ),
                Text(
                  'Você tem certeza que deseja deletar a senha "${widget.password}"?',
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancelar",
                        style: textTheme.bodyLarge!.copyWith(
                          color: const Color.fromARGB(255, 100, 100, 100),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        foregroundColor: colorScheme.background,
                      ),
                      onPressed: () {
                        widget.delete();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(                     
                          SnackBar(
                            dismissDirection: DismissDirection.horizontal,
                            content: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorScheme.error,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 15),
                                    child: FaIcon(
                                      FontAwesomeIcons.circleExclamation,
                                      color: colorScheme.background,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Senha ${widget.password} deletada com sucesso",
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
                      child: Text(
                        "SIM",
                        style: textTheme.displaySmall!.copyWith(
                          color: colorScheme.background,
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
