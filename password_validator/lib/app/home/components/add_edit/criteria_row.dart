
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CriteriaRow extends StatelessWidget {
  const CriteriaRow({
    required this.criteria,
    required this.criteriaValidation,
    super.key,
  });
  final String criteria;
  final bool criteriaValidation;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: criteriaValidation ? Colors.green : colorScheme.background,
              border: Border.all(
                color: criteriaValidation
                    ? Colors.transparent
                    : const Color(0xFF696969),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.check,
              color: colorScheme.background,
              size: 15,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              criteria,
              style: const TextStyle(
                fontFamily: "Rubik",
                color: Color(0xFF696969),
                fontSize: 14,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
