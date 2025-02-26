import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _state = prefs.getString('ff_state') ?? _state;
    });
    _safeInit(() {
      _colors = _colorFromIntValue(prefs.getInt('ff_colors')) ?? _colors;
    });
    _safeInit(() {
      _users =
          prefs.getStringList('ff_users')?.map((path) => path.ref).toList() ??
              _users;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _activeTab = 0;
  int get activeTab => _activeTab;
  set activeTab(int value) {
    _activeTab = value;
  }

  bool _SearchActive = false;
  bool get SearchActive => _SearchActive;
  set SearchActive(bool value) {
    _SearchActive = value;
  }

  bool _SearchActive2 = false;
  bool get SearchActive2 => _SearchActive2;
  set SearchActive2(bool value) {
    _SearchActive2 = value;
  }

  List<String> _citylist = [];
  List<String> get citylist => _citylist;
  set citylist(List<String> value) {
    _citylist = value;
  }

  void addToCitylist(String value) {
    citylist.add(value);
  }

  void removeFromCitylist(String value) {
    citylist.remove(value);
  }

  void removeAtIndexFromCitylist(int index) {
    citylist.removeAt(index);
  }

  void updateCitylistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    citylist[index] = updateFn(_citylist[index]);
  }

  void insertAtIndexInCitylist(int index, String value) {
    citylist.insert(index, value);
  }

  String _state = '';
  String get state => _state;
  set state(String value) {
    _state = value;
    prefs.setString('ff_state', value);
  }

  Color _colors = Colors.transparent;
  Color get colors => _colors;
  set colors(Color value) {
    _colors = value;
    prefs.setInt('ff_colors', value.value);
  }

  List<String> _sidedegrees = [];
  List<String> get sidedegrees => _sidedegrees;
  set sidedegrees(List<String> value) {
    _sidedegrees = value;
  }

  void addToSidedegrees(String value) {
    sidedegrees.add(value);
  }

  void removeFromSidedegrees(String value) {
    sidedegrees.remove(value);
  }

  void removeAtIndexFromSidedegrees(int index) {
    sidedegrees.removeAt(index);
  }

  void updateSidedegreesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sidedegrees[index] = updateFn(_sidedegrees[index]);
  }

  void insertAtIndexInSidedegrees(int index, String value) {
    sidedegrees.insert(index, value);
  }

  bool _menu = false;
  bool get menu => _menu;
  set menu(bool value) {
    _menu = value;
  }

  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? value) {
    _user = value;
  }

  List<DocumentReference> _users = [
    FirebaseFirestore.instance.doc('/users/XKrS9oiKrGOsbVxXRoicNGX17ej1'),
    FirebaseFirestore.instance.doc('/users/GL6pqAbjJUZTzELVHoQC0T6NZ583')
  ];
  List<DocumentReference> get users => _users;
  set users(List<DocumentReference> value) {
    _users = value;
    prefs.setStringList('ff_users', value.map((x) => x.path).toList());
  }

  void addToUsers(DocumentReference value) {
    users.add(value);
    prefs.setStringList('ff_users', _users.map((x) => x.path).toList());
  }

  void removeFromUsers(DocumentReference value) {
    users.remove(value);
    prefs.setStringList('ff_users', _users.map((x) => x.path).toList());
  }

  void removeAtIndexFromUsers(int index) {
    users.removeAt(index);
    prefs.setStringList('ff_users', _users.map((x) => x.path).toList());
  }

  void updateUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    users[index] = updateFn(_users[index]);
    prefs.setStringList('ff_users', _users.map((x) => x.path).toList());
  }

  void insertAtIndexInUsers(int index, DocumentReference value) {
    users.insert(index, value);
    prefs.setStringList('ff_users', _users.map((x) => x.path).toList());
  }

  bool _children2 = false;
  bool get children2 => _children2;
  set children2(bool value) {
    _children2 = value;
  }

  bool _sideDegrees = false;
  bool get sideDegrees => _sideDegrees;
  set sideDegrees(bool value) {
    _sideDegrees = value;
  }

  bool _masonicEducation = false;
  bool get masonicEducation => _masonicEducation;
  set masonicEducation(bool value) {
    _masonicEducation = value;
  }

  bool _children3 = false;
  bool get children3 => _children3;
  set children3(bool value) {
    _children3 = value;
  }
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
