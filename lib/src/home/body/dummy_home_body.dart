import 'package:flutter/material.dart';

class DummyHomeBody extends StatelessWidget {
  const DummyHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
