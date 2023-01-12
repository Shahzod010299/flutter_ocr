# flutter_ocr_sdk

A wrapper for [Dynamsoft OCR SDK](https://www.dynamsoft.com/label-recognition/overview/) with MRZ detection model. It helps developers build Flutter applications to detect machine-readable zones (**MRZ**) in passports, travel documents, and ID cards. 

## Try MRZ Detection Example

### Android
```bash
cd example
flutter run -d <device>
```

![Flutter Passport MRZ recognition](https://www.dynamsoft.com/codepool/img/2021/07/flutter-passport-mrz-recognition.jpg)

## Supported Platforms
- Android

**TODO: Web, Windows, Linux, iOS**

## Installation
Add `flutter_ocr_sdk` as a dependency in your `pubspec.yaml` file.

```yml
dependencies:
    ...
    flutter_ocr_sdk:
```

## Usage
- Download the [model folder](https://github.com/yushulx/flutter_ocr_sdk/tree/main/example/model) to your project, and configure `assets` in `pubspec.yaml`:

    ```yml
    assets:
        - model/
    ```

- Initialize the MRZ detector with a [valid license key](https://www.dynamsoft.com/customer/license/trialLicense/?product=dlr):

    ```dart
    FlutterOcrSdk _mrzDetector = FlutterOcrSdk();
    int? ret = await _mrzDetector.init("", "DLS2eyJoYW5kc2hha2VDb2RlIjoiMjAwMDAxLTE2NDk4Mjk3OTI2MzUiLCJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSIsInNlc3Npb25QYXNzd29yZCI6IndTcGR6Vm05WDJrcEQ5YUoifQ==");
    ```
- Load the MRZ detection model:
    ```dart
    await _mrzDetector.loadModel('model/');
    ```
- Recognize MRZ from an image file:

    ```dart
    List<List<MrzLine>>? results = await _mrzDetector.recognizeByFile(photo.path);
    ```
- Recognize MRZ from an image buffer:

    ```dart
    ui.Image image = await decodeImageFromList(fileBytes);

    ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.rawRgba);

    List<List<MrzLine>>? results = await _mrzDetector.recognizeByBuffer(
          byteData.buffer.asUint8List(),
          image.width,
          image.height,
          byteData.lengthInBytes ~/ image.height,
          ImagePixelFormat.IPF_ARGB_8888.index);
    ```
- Parse MRZ information:

    ```dart
     String information = '';
    if (results != null && results.isNotEmpty) {
        for (List<MrzLine> area in results) {
            if (area.length == 2) {
            information =
                MRZ.parseTwoLines(area[0].text, area[1].text).toString();
            } else if (area.length == 3) {
            information = MRZ
                .parseThreeLines(area[0].text, area[1].text, area[2].text)
                .toString();
            }
        }
    }
    ```


