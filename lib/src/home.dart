import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<Offset> _tween;
  final Cubic curve = Curves.easeInOutCubic;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.medium1,
    );
    _tween = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(200, 0),
    )..chain(CurveTween(curve: curve));
    _animation = _animationController.drive(_tween);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (kDebugMode) {
      print('$size ${_animation.value} ${_animation.status}');
    }
    return Scaffold(
      body: Stack(
        children: [
          // Drawer 部分、固定で左側に置く（仮に青いコンテナでメニュー表示）
          Container(
            width: size.width,
            color: Colors.blueGrey,
            child: const Center(
              child: Text(
                'Drawer Menu',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          // ホーム画面全体、アニメーションで右にスライド
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: _animation.value.dx,
                width: size.width,
                height: size.height,
                child: SizedBox.expand(
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.surface,
                    child:
                        child ??
                        SafeArea(
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.menu),
                                      onPressed: () {
                                        if (_animation.value.dx == 0) {
                                          setState(() {
                                            unawaited(
                                              _animationController.forward(),
                                            );
                                          });
                                        } else if (_animation.value.dx == 200) {
                                          setState(() {
                                            unawaited(
                                              _animationController.reverse(),
                                            );
                                          });
                                        }
                                      },
                                    ),
                                    const Expanded(
                                      child: Text(
                                        'ホーム',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 100,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          child: Icon(Icons.person),
                                        ),
                                        title: Text('ユーザー $index'),
                                        subtitle: Text(
                                          'これはツイート $index の内容です。Twitter クローンでアニメーション勉強中！',
                                        ),
                                        trailing: IconButton(
                                          icon: const Icon(
                                            Icons.favorite_border,
                                          ),
                                          onPressed: () {},
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
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
}
