import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ocr_sdk_method_channel.dart';
import 'mrz_line.dart';

/// Image pixel format.
enum ImagePixelFormat {
  /// 0:Black, 1:White
  IPF_BINARY,

  /// 0:White, 1:Black
  IPF_BINARYINVERTED,

  /// 8bit gray
  IPF_GRAYSCALED,

  /// NV21
  IPF_NV21,

  /// 16bit with RGB channel order stored in memory from high to low address
  IPF_RGB_565,

  /// 16bit with RGB channel order stored in memory from high to low address
  IPF_RGB_555,

  /// 24bit with RGB channel order stored in memory from high to low address
  IPF_RGB_888,

  /// 32bit with ARGB channel order stored in memory from high to low address
  IPF_ARGB_8888,

  /// 48bit with RGB channel order stored in memory from high to low address
  IPF_RGB_161616,

  /// 64bit with ARGB channel order stored in memory from high to low address
  IPF_ARGB_16161616,

  /// 32bit with ABGR channel order stored in memory from high to low address
  IPF_ABGR_8888,

  /// 64bit with ABGR channel order stored in memory from high to low address
  IPF_ABGR_16161616,

  /// 24bit with BGR channel order stored in memory from high to low address
  IPF_BGR_888
}

abstract class FlutterOcrSdkPlatform extends PlatformInterface {
  /// Constructs a FlutterOcrSdkPlatform.
  FlutterOcrSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOcrSdkPlatform _instance = MethodChannelFlutterOcrSdk();

  /// The default instance of [FlutterOcrSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOcrSdk].
  static FlutterOcrSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOcrSdkPlatform] when
  /// they register themselves.
  static set instance(FlutterOcrSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> init(String path, String key) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<List<List<MrzLine>>?> recognizeByBuffer(
      Uint8List bytes, int width, int height, int stride, int format) {
    throw UnimplementedError('recognizeByBuffer() has not been implemented.');
  }

  Future<List<List<MrzLine>>?> recognizeByFile(String filename) {
    throw UnimplementedError('recognizeByFile() has not been implemented.');
  }

  Future<int?> loadModel(String modelPath) async {
    throw UnimplementedError('loadModel() has not been implemented.');
  }
}
