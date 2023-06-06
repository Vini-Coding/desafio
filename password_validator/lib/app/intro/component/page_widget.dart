import 'package:flutter/material.dart';

class PageWidget extends StatefulWidget {
  const PageWidget({
    required this.title,
    required this.assetImage,
    required this.description,
    super.key,
  });
  final String title;
  final String assetImage;
  final String description;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title,
                style: textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              Image(
                image: AssetImage(widget.assetImage),
              ),
              Text(
                widget.description,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
