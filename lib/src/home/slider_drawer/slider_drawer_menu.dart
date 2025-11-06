import 'package:flutter/material.dart';

enum SliderDrawerMode { fixed, ratio }

class SliderDrawerMenu extends StatelessWidget {
  const SliderDrawerMenu._({
    required this.mode,
    required this.width,
    required this.ratio,
    super.key,
  });

  const SliderDrawerMenu.fixed({
    required double width,
    Key? key,
  }) : this._(mode: SliderDrawerMode.fixed, width: width, ratio: -1, key: key);

  const SliderDrawerMenu.ratio({required double ratio, Key? key})
    : this._(mode: SliderDrawerMode.ratio, width: 0, ratio: ratio, key: key);

  final SliderDrawerMode mode;
  final double width;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return switch (mode) {
      SliderDrawerMode.fixed => _FixedDrawerMenu(width: width),
      SliderDrawerMode.ratio => _RatioDrawerMenu(ratio: ratio),
    };
  }

  double getDrawerWidth(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    assert(
      deviceWidth > width,
      'Must be drawer width are less than device width',
    );
    assert(
      0 < ratio && ratio <= 1,
      'Must be drawer ratio are 0 to 1',
    );
    return switch (mode) {
      SliderDrawerMode.fixed => width,
      SliderDrawerMode.ratio => deviceWidth * ratio,
    };
  }
}

class _FixedDrawerMenu extends StatelessWidget {
  const _FixedDrawerMenu({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Drawer Menu',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

class _RatioDrawerMenu extends StatelessWidget {
  const _RatioDrawerMenu({required this.ratio});

  final double ratio;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: ratio,
      alignment: Alignment.centerLeft,
      child: const Center(
        child: Text(
          'Drawer Menu',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
