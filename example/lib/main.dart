import 'dart:typed_data';

import 'package:flummkv/flummkv.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final mmkv0 = Mmkv();
  final mmkv1 = Mmkv(id: 'mmkv1');
  final mmkv2 = Mmkv(id: 'mmkv2', crypt: '8888888');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              width: double.maxFinite,
              color: Colors.blue,
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('mmkv0')),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('count'),
                    onPressed: () async {
                      print('count: ${await mmkv0.count()}');
                    }),
                RaisedButton(
                    child: Text('allKeys'),
                    onPressed: () async {
                      print('allKeys: ${await mmkv0.allKeys()}');
                    }),
                RaisedButton(
                    child: Text('clear'),
                    onPressed: () async {
                      print('clear: ${await mmkv0.clear()}');
                    }),
                RaisedButton(
                    child: Text('contains'),
                    onPressed: () async {
                      print('contains \'Int\': ${await mmkv0.contains('Int')}');
                    }),
                RaisedButton(
                    child: Text('getValueSize'),
                    onPressed: () async {
                      print(
                          'getValueSize \'Int\': ${await mmkv0.getValueSize('Int')}');
                    }),
                RaisedButton(
                    child: Text('removeByKey'),
                    onPressed: () async {
                      print(
                          'removeByKey \'Int\': ${await mmkv0.removeByKey('Int')}');
                    }),
                RaisedButton(
                    child: Text('totalSize'),
                    onPressed: () async {
                      print('totalSize: ${await mmkv0.totalSize()}');
                    }),
                RaisedButton(
                    child: Text('pageSize'),
                    onPressed: () async {
                      print('pageSize: ${await Flummkv.pageSize()}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setInt'),
                    onPressed: () async {
                      print('setInt: ${await mmkv0.setInt('Int', 100)}');
                    }),
                RaisedButton(
                    child: Text('getInt'),
                    onPressed: () async {
                      print('getInt: ${await mmkv0.getInt('Int')}');
                    }),
              ],
            ),
            Container(
              width: double.maxFinite,
              color: Colors.red,
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('mmkv1')),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('count'),
                    onPressed: () async {
                      print('count: ${await mmkv1.count()}');
                    }),
                RaisedButton(
                    child: Text('allKeys'),
                    onPressed: () async {
                      print('allKeys: ${await mmkv1.allKeys()}');
                    }),
                RaisedButton(
                    child: Text('clear'),
                    onPressed: () async {
                      print('clear: ${await mmkv1.clear()}');
                    }),
                RaisedButton(
                    child: Text('contains'),
                    onPressed: () async {
                      print('contains \'Int\': ${await mmkv1.contains('Int')}');
                    }),
                RaisedButton(
                    child: Text('getValueSize'),
                    onPressed: () async {
                      print(
                          'getValueSize \'Int\': ${await mmkv1.getValueSize('Int')}');
                    }),
                RaisedButton(
                    child: Text('removeByKey'),
                    onPressed: () async {
                      print(
                          'removeByKey \'Int\': ${await mmkv1.removeByKey('Int')}');
                    }),
                RaisedButton(
                    child: Text('totalSize'),
                    onPressed: () async {
                      print('totalSize: ${await mmkv1.totalSize()}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setInt'),
                    onPressed: () async {
                      print(
                          'setInt: ${await mmkv1.set('Int', 9223372036854775807)}');
                    }),
                RaisedButton(
                    child: Text('getInt'),
                    onPressed: () async {
                      print('getInt: ${await mmkv1.get<int>('Int')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setBool'),
                    onPressed: () async {
                      print('setBool: ${await mmkv1.set('Bool', true)}');
                    }),
                RaisedButton(
                    child: Text('getBool'),
                    onPressed: () async {
                      print('getBool: ${await mmkv1.get<bool>('Bool')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setDouble'),
                    onPressed: () async {
                      print(
                          'setDouble: ${await mmkv1.set('Double', double.maxFinite)}');
                    }),
                RaisedButton(
                    child: Text('getDouble'),
                    onPressed: () async {
                      print('getDouble: ${await mmkv1.get<double>('Double')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setString'),
                    onPressed: () async {
                      print(
                          'setString: ${await mmkv1.set('String', 'Hello, world!')}');
                    }),
                RaisedButton(
                    child: Text('getString'),
                    onPressed: () async {
                      print('getString: ${await mmkv1.get<String>('String')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setUint8List'),
                    onPressed: () async {
                      print('setUint8List: ${await mmkv1.set(
                        'Uint8List',
                        Uint8List.fromList(
                          [1, 2, 3],
                        ),
                      )}');
                    }),
                RaisedButton(
                    child: Text('getUint8List'),
                    onPressed: () async {
                      print(
                          'getUint8List: ${await mmkv1.get<Uint8List>('Uint8List')}');
                    }),
              ],
            ),
            Container(
              width: double.maxFinite,
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('mmkv2')),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('count'),
                    onPressed: () async {
                      print('count: ${await mmkv2.count()}');
                    }),
                RaisedButton(
                    child: Text('allKeys'),
                    onPressed: () async {
                      print('allKeys: ${await mmkv2.allKeys()}');
                    }),
                RaisedButton(
                    child: Text('clear'),
                    onPressed: () async {
                      print('clear: ${await mmkv2.clear()}');
                    }),
                RaisedButton(
                    child: Text('contains'),
                    onPressed: () async {
                      print('contains \'Int\': ${await mmkv2.contains('Int')}');
                    }),
                RaisedButton(
                    child: Text('getValueSize'),
                    onPressed: () async {
                      print(
                          'getValueSize \'Int\': ${await mmkv2.getValueSize('Int')}');
                    }),
                RaisedButton(
                    child: Text('removeByKey'),
                    onPressed: () async {
                      print(
                          'removeByKey \'Int\': ${await mmkv2.removeByKey('Int')}');
                    }),
                RaisedButton(
                    child: Text('totalSize'),
                    onPressed: () async {
                      print('totalSize: ${await mmkv2.totalSize()}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setInt'),
                    onPressed: () async {
                      print(
                          'setInt: ${await mmkv2.setInt('Int', 9223372036854775807)}');
                    }),
                RaisedButton(
                    child: Text('getInt'),
                    onPressed: () async {
                      print('getInt: ${await mmkv2.getInt('Int')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setBool'),
                    onPressed: () async {
                      print('setBool: ${await mmkv2.setBool('Bool', true)}');
                    }),
                RaisedButton(
                    child: Text('getBool'),
                    onPressed: () async {
                      print('getBool: ${await mmkv2.getBool('Bool')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setDouble'),
                    onPressed: () async {
                      print(
                          'setDouble: ${await mmkv2.setDouble('Double', double.maxFinite)}');
                    }),
                RaisedButton(
                    child: Text('getDouble'),
                    onPressed: () async {
                      print('getDouble: ${await mmkv2.getDouble('Double')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setString'),
                    onPressed: () async {
                      print(
                          'setString: ${await mmkv2.setString('String', 'Hello, world!')}');
                    }),
                RaisedButton(
                    child: Text('getString'),
                    onPressed: () async {
                      print('getString: ${await mmkv2.getString('String')}');
                    }),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('setUint8List'),
                    onPressed: () async {
                      print('setUint8List: ${await mmkv2.setUint8List(
                        'Uint8List',
                        Uint8List.fromList(
                          [1, 2, 3],
                        ),
                      )}');
                    }),
                RaisedButton(
                    child: Text('getUint8List'),
                    onPressed: () async {
                      print(
                          'getUint8List: ${await mmkv2.getUint8List('Uint8List')}');
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
