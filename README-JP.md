# twitter_clone

Twitter(X)のクローンアプリを作り勉強することにしました。

## 主な動作

- 無限リストビュー（未実装）
- スライドするドロワーメニュー
- and more...

### スライドするドロワーメニュー

![スライドするドロワーメニューのGIF](documents/assets/slider_drawer.gif)

## getting start

このプロジェクトではFVMを利用しています。

FVMを利用することを推奨しますが、[pubspec.yaml](pubspec.yaml)のenvironmentを変更することでネイティブSDKでも対応可能です。

```yaml
environment:
  sdk: ^3.9.2 # ここのバージョンをDartSDKバージョンに合わせる
```

その後 `flutter run` してください。
