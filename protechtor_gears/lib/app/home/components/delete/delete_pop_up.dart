import 'package:flutter/material.dart';

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
