# fmmkv

Plugin that allow Flutter to read value from persistent storage or save value to persistent storage based on MMKV framework

## Getting Started

Open terminal, cd to your project directory, run pod repo update to make CocoaPods aware of the latest available MMKV versions

## Quick Tutorial

```dart

  MMKV mmkv = MMKV();
  // MMKV mmkv = MMKV(id: 'other', crypt: 'crypt');
  
  print('count: ${await mmkv.count()}');
  print('allKeys: ${await mmkv.allKeys()}');
  print('clear: ${await mmkv.clear()}');
  print('contains \'Int\': ${await mmkv.contains('Int')}');
  print('removeByKey \'Int\': ${await mmkv.removeByKey('Int')}');
  print('totalSize: ${await mmkv.totalSize()}');
  
  // Generic methods
  print('setInt: ${await mmkv1.set('Int', 9223372036854775807)}');
  print('getInt: ${await mmkv1.get<int>('Int')}');
  
  print('setInt: ${await mmkv.setInt('Int', 9223372036854775807)}');
  print('setInt: ${await mmkv.getInt('Int')}');
  
  print('setBool: ${await mmkv.setBool('Bool', true)}');
  print('getBool: ${await mmkv.getBool('Bool')}');
  
  print('setDouble: ${await mmkv.setDouble('Double', double.maxFinite)}');
  print('getDouble: ${await mmkv.getDouble('Double')}');
  
  print('setString: ${await mmkv.setString('String', 'Hello, world!')}');
  print('getString: ${await mmkv.getString('String')}');

  print('setUint8List: ${await mmkv.setUint8List('Uint8List', Uint8List.fromList([1, 2, 3],),)}');
  print('getUint8List: ${await mmkv.getUint8List('Uint8List')}');
  
```