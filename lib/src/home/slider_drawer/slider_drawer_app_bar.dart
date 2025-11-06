import 'package:flutter/material.dart';

class SliderDrawerAppBarOption {
  const SliderDrawerAppBarOption({this.title, this.actions});

  final Widget? title;
  final List<Widget>? actions;
}

class SliderDrawerAppBar extends StatelessWidget {
  const SliderDrawerAppBar({
    required this.onPressed,
    this.title,
    this.actions,
    super.key,
  });

  final Widget? title;
  final List<Widget>? actions;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onPressed,
        ),
        if (title != null) title!,
        if (actions != null && actions!.isNotEmpty)
          Row(
            children: actions!,
          ),
      ],
    );
  }
}
