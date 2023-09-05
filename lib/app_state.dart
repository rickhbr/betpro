import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_resultado')) {
        try {
          _resultado = jsonDecode(prefs.getString('ff_resultado') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_FutAppState')) {
        try {
          _FutAppState = jsonDecode(prefs.getString('ff_FutAppState') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dragonTigerAppState')) {
        try {
          _dragonTigerAppState =
              jsonDecode(prefs.getString('ff_dragonTigerAppState') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_extremeAppState')) {
        try {
          _extremeAppState =
              jsonDecode(prefs.getString('ff_extremeAppState') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _minesImageListAppState =
          prefs.getStringList('ff_minesImageListAppState') ??
              _minesImageListAppState;
    });
    _safeInit(() {
      _penaltyAppState =
          prefs.getStringList('ff_penaltyAppState') ?? _penaltyAppState;
    });
    _safeInit(() {
      _fortuneAppState =
          prefs.getStringList('ff_fortuneAppState') ?? _fortuneAppState;
    });
    _safeInit(() {
      _oxfortuneAppState =
          prefs.getStringList('ff_oxfortuneAppState') ?? _oxfortuneAppState;
    });
    _safeInit(() {
      _mousefortuneAppState = prefs.getStringList('ff_mousefortuneAppState') ??
          _mousefortuneAppState;
    });
    _safeInit(() {
      _ballonAppState =
          prefs.getStringList('ff_ballonAppState') ?? _ballonAppState;
    });
    _safeInit(() {
      _aviatorAppState =
          prefs.getStringList('ff_aviatorAppState') ?? _aviatorAppState;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _resultado =
      jsonDecode('{\"b\":\"Banker\",\"p\":\"Player\",\"t\":\"Tie\"}');
  dynamic get resultado => _resultado;
  set resultado(dynamic _value) {
    _resultado = _value;
    prefs.setString('ff_resultado', jsonEncode(_value));
  }

  dynamic _FutAppState = jsonDecode('{\"l\":\"L\",\"r\":\"R\",\"t\":\"Tie\"}');
  dynamic get FutAppState => _FutAppState;
  set FutAppState(dynamic _value) {
    _FutAppState = _value;
    prefs.setString('ff_FutAppState', jsonEncode(_value));
  }

  dynamic _dragonTigerAppState =
      jsonDecode('{\"y\":\"Yellow\",\"r\":\"Red\",\"g\":\"Green\"}');
  dynamic get dragonTigerAppState => _dragonTigerAppState;
  set dragonTigerAppState(dynamic _value) {
    _dragonTigerAppState = _value;
    prefs.setString('ff_dragonTigerAppState', jsonEncode(_value));
  }

  dynamic _extremeAppState = jsonDecode(
      '{\"col1\":[3,6,9,12,15,18,21,24,27,30,33,36],\"col2\":[2,5,8,11,14,17,20,23,26,29,32,35],\"col3\":[1,4,7,10,13,16,19,22,25,28,31,34]}');
  dynamic get extremeAppState => _extremeAppState;
  set extremeAppState(dynamic _value) {
    _extremeAppState = _value;
    prefs.setString('ff_extremeAppState', jsonEncode(_value));
  }

  List<String> _minesImageListAppState = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/6iowjbejy4vi/m1.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/hk4q6z8jncg2/m2.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/p5n5kbzi9r6o/m3.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/ao9xm9n35lrs/m4.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/2hn0zgdnasu8/m5.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/3fe217evzkh9/m6.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/rclzis5hhiph/m7.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/tqp5essm99d8/m8.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/xm5ot024puts/m9.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/yayivi9m795y/m10.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/tmzq1kebpfmh/m11.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/blpl6oibk728/m12.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/xfazzrrtx7bc/m13.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/fpn3e5d2c2cg/m14.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/xj57tnt0rpsk/m15.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/48kzfdqvvajm/m16.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/3kc4biyk89x4/m17.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/7lq3elzikgo3/m18.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/6l8hwpso9j9v/m19.png'
  ];
  List<String> get minesImageListAppState => _minesImageListAppState;
  set minesImageListAppState(List<String> _value) {
    _minesImageListAppState = _value;
    prefs.setStringList('ff_minesImageListAppState', _value);
  }

  void addToMinesImageListAppState(String _value) {
    _minesImageListAppState.add(_value);
    prefs.setStringList('ff_minesImageListAppState', _minesImageListAppState);
  }

  void removeFromMinesImageListAppState(String _value) {
    _minesImageListAppState.remove(_value);
    prefs.setStringList('ff_minesImageListAppState', _minesImageListAppState);
  }

  void removeAtIndexFromMinesImageListAppState(int _index) {
    _minesImageListAppState.removeAt(_index);
    prefs.setStringList('ff_minesImageListAppState', _minesImageListAppState);
  }

  void updateMinesImageListAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _minesImageListAppState[_index] = updateFn(_minesImageListAppState[_index]);
    prefs.setStringList('ff_minesImageListAppState', _minesImageListAppState);
  }

  List<String> _penaltyAppState = [];
  List<String> get penaltyAppState => _penaltyAppState;
  set penaltyAppState(List<String> _value) {
    _penaltyAppState = _value;
    prefs.setStringList('ff_penaltyAppState', _value);
  }

  void addToPenaltyAppState(String _value) {
    _penaltyAppState.add(_value);
    prefs.setStringList('ff_penaltyAppState', _penaltyAppState);
  }

  void removeFromPenaltyAppState(String _value) {
    _penaltyAppState.remove(_value);
    prefs.setStringList('ff_penaltyAppState', _penaltyAppState);
  }

  void removeAtIndexFromPenaltyAppState(int _index) {
    _penaltyAppState.removeAt(_index);
    prefs.setStringList('ff_penaltyAppState', _penaltyAppState);
  }

  void updatePenaltyAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _penaltyAppState[_index] = updateFn(_penaltyAppState[_index]);
    prefs.setStringList('ff_penaltyAppState', _penaltyAppState);
  }

  List<String> _fortuneAppState = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/poh9eh8b3psw/1.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/c1ooahc9xg99/2.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/ig4vnbihc1js/3.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/sptsh2apm50g/4.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/u1fqltyrzdmp/5.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/su9kt1jp3lpt/6.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/5zbqsze6h01t/7.png'
  ];
  List<String> get fortuneAppState => _fortuneAppState;
  set fortuneAppState(List<String> _value) {
    _fortuneAppState = _value;
    prefs.setStringList('ff_fortuneAppState', _value);
  }

  void addToFortuneAppState(String _value) {
    _fortuneAppState.add(_value);
    prefs.setStringList('ff_fortuneAppState', _fortuneAppState);
  }

  void removeFromFortuneAppState(String _value) {
    _fortuneAppState.remove(_value);
    prefs.setStringList('ff_fortuneAppState', _fortuneAppState);
  }

  void removeAtIndexFromFortuneAppState(int _index) {
    _fortuneAppState.removeAt(_index);
    prefs.setStringList('ff_fortuneAppState', _fortuneAppState);
  }

  void updateFortuneAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _fortuneAppState[_index] = updateFn(_fortuneAppState[_index]);
    prefs.setStringList('ff_fortuneAppState', _fortuneAppState);
  }

  List<String> _oxfortuneAppState = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/25lzrsqbv77z/1_-_ox.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/68jbk4ggzkvk/2_-_ox.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/tfb5yjq0zuk2/3_-_ox.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/l9qfn8stquof/4_-_ox.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/omxyk97wfc4e/5_-_ox.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/u1a5z56431uf/6_-_ox.png'
  ];
  List<String> get oxfortuneAppState => _oxfortuneAppState;
  set oxfortuneAppState(List<String> _value) {
    _oxfortuneAppState = _value;
    prefs.setStringList('ff_oxfortuneAppState', _value);
  }

  void addToOxfortuneAppState(String _value) {
    _oxfortuneAppState.add(_value);
    prefs.setStringList('ff_oxfortuneAppState', _oxfortuneAppState);
  }

  void removeFromOxfortuneAppState(String _value) {
    _oxfortuneAppState.remove(_value);
    prefs.setStringList('ff_oxfortuneAppState', _oxfortuneAppState);
  }

  void removeAtIndexFromOxfortuneAppState(int _index) {
    _oxfortuneAppState.removeAt(_index);
    prefs.setStringList('ff_oxfortuneAppState', _oxfortuneAppState);
  }

  void updateOxfortuneAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _oxfortuneAppState[_index] = updateFn(_oxfortuneAppState[_index]);
    prefs.setStringList('ff_oxfortuneAppState', _oxfortuneAppState);
  }

  List<String> _mousefortuneAppState = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/g40m2y2f5ylx/mouse_1.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/id7d70de1ffr/mouse_2.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/y3e0rjvb221l/mouse_3.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/rm6bvgr89lp8/mouse_4.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/fvlym8n32kdm/mouse_5.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/n3t7g29qen1g/mouse_6.png'
  ];
  List<String> get mousefortuneAppState => _mousefortuneAppState;
  set mousefortuneAppState(List<String> _value) {
    _mousefortuneAppState = _value;
    prefs.setStringList('ff_mousefortuneAppState', _value);
  }

  void addToMousefortuneAppState(String _value) {
    _mousefortuneAppState.add(_value);
    prefs.setStringList('ff_mousefortuneAppState', _mousefortuneAppState);
  }

  void removeFromMousefortuneAppState(String _value) {
    _mousefortuneAppState.remove(_value);
    prefs.setStringList('ff_mousefortuneAppState', _mousefortuneAppState);
  }

  void removeAtIndexFromMousefortuneAppState(int _index) {
    _mousefortuneAppState.removeAt(_index);
    prefs.setStringList('ff_mousefortuneAppState', _mousefortuneAppState);
  }

  void updateMousefortuneAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _mousefortuneAppState[_index] = updateFn(_mousefortuneAppState[_index]);
    prefs.setStringList('ff_mousefortuneAppState', _mousefortuneAppState);
  }

  List<String> _ballonAppState = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/4w5nm42m8lqf/1.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/8w13pv6bpmx0/2.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/u5n4eu312es5/3.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/3a5juexdjwo1/4.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/f7cafqsk78os/5.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/ncbsad0erd6h/6.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/gnly6kybi3cg/7.png'
  ];
  List<String> get ballonAppState => _ballonAppState;
  set ballonAppState(List<String> _value) {
    _ballonAppState = _value;
    prefs.setStringList('ff_ballonAppState', _value);
  }

  void addToBallonAppState(String _value) {
    _ballonAppState.add(_value);
    prefs.setStringList('ff_ballonAppState', _ballonAppState);
  }

  void removeFromBallonAppState(String _value) {
    _ballonAppState.remove(_value);
    prefs.setStringList('ff_ballonAppState', _ballonAppState);
  }

  void removeAtIndexFromBallonAppState(int _index) {
    _ballonAppState.removeAt(_index);
    prefs.setStringList('ff_ballonAppState', _ballonAppState);
  }

  void updateBallonAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _ballonAppState[_index] = updateFn(_ballonAppState[_index]);
    prefs.setStringList('ff_ballonAppState', _ballonAppState);
  }

  List<String> _aviatorAppState = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/f2n6chzvsdh8/_AVIATOR_1.5X.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hackeando-1uzsi8/assets/tywji2lhx8q9/_AVIATOR_2.0X.png'
  ];
  List<String> get aviatorAppState => _aviatorAppState;
  set aviatorAppState(List<String> _value) {
    _aviatorAppState = _value;
    prefs.setStringList('ff_aviatorAppState', _value);
  }

  void addToAviatorAppState(String _value) {
    _aviatorAppState.add(_value);
    prefs.setStringList('ff_aviatorAppState', _aviatorAppState);
  }

  void removeFromAviatorAppState(String _value) {
    _aviatorAppState.remove(_value);
    prefs.setStringList('ff_aviatorAppState', _aviatorAppState);
  }

  void removeAtIndexFromAviatorAppState(int _index) {
    _aviatorAppState.removeAt(_index);
    prefs.setStringList('ff_aviatorAppState', _aviatorAppState);
  }

  void updateAviatorAppStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _aviatorAppState[_index] = updateFn(_aviatorAppState[_index]);
    prefs.setStringList('ff_aviatorAppState', _aviatorAppState);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
