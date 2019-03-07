import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flummkv/flummkv.dart';

void main() {
  const MethodChannel channel = MethodChannel('flummkv');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
