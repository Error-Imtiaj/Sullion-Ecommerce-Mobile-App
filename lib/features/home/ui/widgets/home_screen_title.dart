import 'package:flutter/material.dart';

class HomeScreenTitle extends StatelessWidget {
  final String title;
  final Function()? onPressedViewAll;
  const HomeScreenTitle({
    super.key,
    required this.title,
    this.onPressedViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onPressedViewAll,
          child: Text(
            "View All",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
