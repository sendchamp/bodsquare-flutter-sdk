<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


A wrapper around the Bodsquare communication APIs.

## Features
- Add your  facebook, instagram and whatsapp accounts as channels.
- Chat with customers from connected channels.

## Getting started

Add as a dependency:
```yaml
bodsquare_sdk: latest_version
```

#### ANDROID SETUP:
Add the folllowing to the android > app > src > main > AndroidManifest.xml file.
```xml
<intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data
                android:scheme="bodsquaresocial"
                android:host="social-page.bodsquare.com"/>
               
            </intent-filter>
```
#### IOS SETUP:
Add the following to the Info.plist file.

```
<key>CFBundleURLTypes</key>
  <array>
      <dict>
          <key>CFBundleTypeRole</key>
          <string>Editor</string>
          <key>CFBundleURLName</key>
          <string>social-page.bodsquare.com</string>
          <key>CFBundleURLSchemes</key>
          <array>
              <string>bodsquaresocial</string>
          </array>
      </dict>
  </array>

<key>NSCameraUsageDescription</key>
	<string>camera</string>
	<!-- Permission options for the `microphone` group -->
	<key>NSMicrophoneUsageDescription</key>
	<string>microphone</string>
	<!-- Permission options for the `photos` group -->
	<key>NSPhotoLibraryUsageDescription</key>
	<string>photos</string>

```


## Usage

Import into your code:
```dart
import 'package:bodsquare_sdk/bodsquare_sdk.dart';
```



And use in any place within a widget to call the bodsquare_Sdk



```dart
final BodsquareSdk bodsquareSdk = BodsquareSdk();

ElevatedButton(
                onPressed: (() {
                  bodsquareSdk.getChannels(
                      context: context,
                      email: 'youremail@email.com',
                      userName: 'username');
                }),


```