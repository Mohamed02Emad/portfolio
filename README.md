# Run commands

for generating
```shell
flutter packages pub run build_runner clean
flutter packages pub run build_runner build
```
launch icon
```shell
flutter pub run flutter_launcher_icons
```
splash
```shell
flutter pub run flutter_native_splash:create
```

build web
```shell
flutter build web && mv build/web ./upload
```

get sha1
```shell
cd android
./gradlew signingReport
```

change package
```shell
fvm flutter pub run change_app_package_name:main com.decorizer.mobile
```

change app name
```shell
fvm flutter pub run rename_app:main all="Decorizer"
```
generate file that contains localization keys
```shell
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/common/resources/gen" -o "locale_keys.g.dart" -f keys
```
