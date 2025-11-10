import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.sizeOf(context);
    const iconSize = 36.0;
    return ColoredBox(
      color: colorScheme.surface,
      child: SizedBox(
        width: size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home_filled,
                size: iconSize,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: iconSize,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                size: iconSize,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.mail_outline,
                size: iconSize,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
