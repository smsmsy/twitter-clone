import 'package:flutter/material.dart';

class DummyHomeBody extends StatelessWidget {
  const DummyHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          final theme = Theme.of(context);
          final textTheme = theme.textTheme;
          final colorScheme = theme.colorScheme;
          final onSurfaceSecondly = textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface.withAlpha(150),
          );
          const dummyIcon = SizedBox.square(
            dimension: 44,
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          );
          final dummyUserName = 'ユーザー $index';
          final dummyUserAccountName = '@UserAccount_$index';
          final dummyTweetText =
              'これはツイート $index の内容です。Twitter クローンでアニメーション勉強中！ '
              'あああああああああああああああああああああああああああああああああああああああああああ';

          const iconDataList = [
            Icons.reply,
            Icons.star_outline,
            Icons.replay,
            Icons.remove_red_eye_outlined,
            Icons.bookmark_outline,
            Icons.share,
          ];
          Icon buildIcon(IconData e) => Icon(
            e,
            color: onSurfaceSecondly?.color,
            size: 20,
          );
          final icons = iconDataList.map(buildIcon).toList();

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dummyIcon,
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // UserInfo
                          Row(
                            children: [
                              Text(
                                dummyUserName,
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                dummyUserAccountName,
                                style: onSurfaceSecondly,
                              ),
                            ],
                          ),

                          // TweetContent
                          Text(
                            dummyTweetText,
                            maxLines: 7,
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),

                          // Icons
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                icons[0],
                                icons[1],
                                icons[2],
                                icons[3],
                                icons[4],
                                icons[5],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: MoreTweetMenuButton(
                  onSurfaceSecondly: onSurfaceSecondly,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MoreTweetMenuButton extends StatelessWidget {
  const MoreTweetMenuButton({
    required this.onSurfaceSecondly,
    super.key,
  });

  final TextStyle? onSurfaceSecondly;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('hogehoge');
      },
      child: Icon(
        Icons.adaptive.more,
        color: onSurfaceSecondly?.color,
        size: 20,
      ),
    );
  }
}
