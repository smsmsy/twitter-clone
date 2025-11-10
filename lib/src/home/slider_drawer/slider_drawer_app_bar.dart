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
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const SizedBox.square(
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              onPressed: onPressed,
            ),
          ),
          if (title != null) title!,
          if (actions != null && actions!.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }
}
