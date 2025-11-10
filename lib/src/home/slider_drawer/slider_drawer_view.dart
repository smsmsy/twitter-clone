import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/src/home/slider_drawer/slider_drawer_app_bar.dart';
import 'package:twitter_clone/src/home/slider_drawer/slider_drawer_menu.dart';

class SliderDrawerView extends ConsumerStatefulWidget {
  const SliderDrawerView({
    required this.drawer,
    required this.body,
    this.appBarOption,
    super.key,
  });

  final SliderDrawerAppBarOption? appBarOption;
  final SliderDrawerMenu drawer;
  final Widget body;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SliderDrawerViewState();
}

class _SliderDrawerViewState extends ConsumerState<SliderDrawerView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Duration _duration = Durations.medium1;
  late Tween<Offset> _tween;
  final Cubic curve = Curves.easeInOutCubic;
  late Animation<Offset> _animation;

  late double drawerWidth;

  double dragged = 0;
  double draggedRatio = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    drawerWidth = widget.drawer.getDrawerWidth(context);
    _tween = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(drawerWidth, 0),
    );
    _tween.chain(CurveTween(curve: curve));
    _animation = _animationController.drive(_tween);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _animationController.duration = Duration.zero;
      },
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: (details) => _resetDragState(),
      onHorizontalDragCancel: _resetDragState,
      child: Stack(
        children: [
          Container(
            width: size.width,
            color: Colors.blueGrey,
            child: widget.drawer,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final colorScheme = Theme.of(context).colorScheme;
              return Positioned(
                left: _animation.value.dx,
                width: size.width,
                height: size.height,
                child: ColoredBox(
                  color: colorScheme.surface,
                  child: SafeArea(
                    child: Column(
                      children: [
                        SliderDrawerAppBar(
                          title: widget.appBarOption?.title,
                          actions: widget.appBarOption?.actions,
                          onPressed: _onPressedDrawerButton,
                        ),
                        widget.body,
                        const Divider(height: 0),
                        const BottomNavigationBar(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onPressedDrawerButton() {
    if (_animation.value.dx == 0) {
      setState(() {
        unawaited(
          _animationController.forward(),
        );
      });
    } else if (_animation.value.dx == drawerWidth) {
      setState(() {
        unawaited(
          _animationController.reverse(),
        );
      });
    }
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragged += details.delta.dx;
      draggedRatio = dragged / drawerWidth;
      unawaited(_animationController.animateTo(draggedRatio));
    });
  }

  void _resetDragState() {
    setState(() {
      _animationController.duration = _duration;
      if (draggedRatio < 0.5) {
        unawaited(_animationController.reverse());
        draggedRatio = 0;
      } else {
        unawaited(_animationController.forward());
        dragged = drawerWidth;
        draggedRatio = 1;
      }
    });
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
  });

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
