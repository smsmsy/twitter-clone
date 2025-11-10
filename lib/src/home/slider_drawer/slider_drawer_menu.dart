import 'package:flutter/material.dart';

enum SliderDrawerMode { fixed, ratio }

class SliderDrawerMenu extends StatelessWidget {
  const SliderDrawerMenu._({
    required this.mode,
    required this.body,
    this.width = 0,
    this.ratio = 0,
    super.key,
  });

  const SliderDrawerMenu.fixed({
    required double width,
    required Widget body,
    Key? key,
  }) : this._(
         mode: SliderDrawerMode.fixed,
         body: body,
         width: width,
         key: key,
       );

  const SliderDrawerMenu.ratio({
    required double ratio,
    required Widget body,
    Key? key,
  }) : this._(
         mode: SliderDrawerMode.ratio,
         body: body,
         ratio: ratio,
         key: key,
       );

  final SliderDrawerMode mode;
  final Widget body;
  final double width;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return switch (mode) {
      SliderDrawerMode.fixed => _FixedDrawerMenu(width: width, body: body),
      SliderDrawerMode.ratio => _RatioDrawerMenu(ratio: ratio, body: body),
    };
  }

  double getDrawerWidth(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    assert(
      deviceWidth > width,
      'Must be drawer width are less than device width',
    );
    assert(
      0 <= ratio && ratio <= 1,
      'Must be drawer ratio are 0 to 1',
    );
    return switch (mode) {
      SliderDrawerMode.fixed => width,
      SliderDrawerMode.ratio => deviceWidth * ratio,
    };
  }
}

class _FixedDrawerMenu extends StatelessWidget {
  const _FixedDrawerMenu({required this.width, required this.body});

  final double width;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: width,
        child: body,
      ),
    );
  }
}

class _RatioDrawerMenu extends StatelessWidget {
  const _RatioDrawerMenu({required this.ratio, required this.body});

  final double ratio;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: ratio,
      alignment: Alignment.centerLeft,
      child: body,
    );
  }
}
