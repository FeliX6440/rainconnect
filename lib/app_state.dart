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
      _selectedStarterTemplate = prefs
              .getStringList('ff_selectedStarterTemplate')
              ?.map((path) => path.ref)
              .toList() ??
          _selectedStarterTemplate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _languageList = [
    'English',
    'French',
    'Chinese',
    'Russian',
    'German',
    'Italian'
  ];
  List<String> get languageList => _languageList;
  set languageList(List<String> value) {
    _languageList = value;
  }

  void addToLanguageList(String value) {
    _languageList.add(value);
  }

  void removeFromLanguageList(String value) {
    _languageList.remove(value);
  }

  void removeAtIndexFromLanguageList(int index) {
    _languageList.removeAt(index);
  }

  void updateLanguageListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _languageList[index] = updateFn(_languageList[index]);
  }

  void insertAtIndexInLanguageList(int index, String value) {
    _languageList.insert(index, value);
  }

  String _audioTextResult = '';
  String get audioTextResult => _audioTextResult;
  set audioTextResult(String value) {
    _audioTextResult = value;
  }

  List<TemplateStruct> _templates = [
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{"name":"Speech to text","description":"Take Notes, Summarize and Translate your Thoughts on the go"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{"name":"Business card reader","description":"Standard Contact Card with integrated Business Card Reader"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{"name":"Lead temperature","description":"Set your Lead priority and always Know who is more important"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{"name":"Note","description":"Simple Text field to take notes"}'))
  ];
  List<TemplateStruct> get templates => _templates;
  set templates(List<TemplateStruct> value) {
    _templates = value;
  }

  void addToTemplates(TemplateStruct value) {
    _templates.add(value);
  }

  void removeFromTemplates(TemplateStruct value) {
    _templates.remove(value);
  }

  void removeAtIndexFromTemplates(int index) {
    _templates.removeAt(index);
  }

  void updateTemplatesAtIndex(
    int index,
    TemplateStruct Function(TemplateStruct) updateFn,
  ) {
    _templates[index] = updateFn(_templates[index]);
  }

  void insertAtIndexInTemplates(int index, TemplateStruct value) {
    _templates.insert(index, value);
  }

  List<DocumentReference> _starterTemplateRefs = [
    FirebaseFirestore.instance.doc('/templates/JU1ksivyJfDlMy56kVfs'),
    FirebaseFirestore.instance.doc('/templates/tc9uD9MTBLcO4Xnh54oS'),
    FirebaseFirestore.instance.doc('/templates/uSWZfZcNjoVCl5y1ojkT'),
    FirebaseFirestore.instance.doc('/templates/bCgEwBkohz1awIQ50ZTi')
  ];
  List<DocumentReference> get starterTemplateRefs => _starterTemplateRefs;
  set starterTemplateRefs(List<DocumentReference> value) {
    _starterTemplateRefs = value;
  }

  void addToStarterTemplateRefs(DocumentReference value) {
    _starterTemplateRefs.add(value);
  }

  void removeFromStarterTemplateRefs(DocumentReference value) {
    _starterTemplateRefs.remove(value);
  }

  void removeAtIndexFromStarterTemplateRefs(int index) {
    _starterTemplateRefs.removeAt(index);
  }

  void updateStarterTemplateRefsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _starterTemplateRefs[index] = updateFn(_starterTemplateRefs[index]);
  }

  void insertAtIndexInStarterTemplateRefs(
      int index, DocumentReference value) {
    _starterTemplateRefs.insert(index, value);
  }

  List<DocumentReference> _selectedStarterTemplate = [];
  List<DocumentReference> get selectedStarterTemplate =>
      _selectedStarterTemplate;
  set selectedStarterTemplate(List<DocumentReference> value) {
    _selectedStarterTemplate = value;
    prefs.setStringList(
        'ff_selectedStarterTemplate', value.map((x) => x.path).toList());
  }

  void addToSelectedStarterTemplate(DocumentReference value) {
    _selectedStarterTemplate.add(value);
    prefs.setStringList('ff_selectedStarterTemplate',
        _selectedStarterTemplate.map((x) => x.path).toList());
  }

  void removeFromSelectedStarterTemplate(DocumentReference value) {
    _selectedStarterTemplate.remove(value);
    prefs.setStringList('ff_selectedStarterTemplate',
        _selectedStarterTemplate.map((x) => x.path).toList());
  }

  void removeAtIndexFromSelectedStarterTemplate(int index) {
    _selectedStarterTemplate.removeAt(index);
    prefs.setStringList('ff_selectedStarterTemplate',
        _selectedStarterTemplate.map((x) => x.path).toList());
  }

  void updateSelectedStarterTemplateAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedStarterTemplate[index] =
        updateFn(_selectedStarterTemplate[index]);
    prefs.setStringList('ff_selectedStarterTemplate',
        _selectedStarterTemplate.map((x) => x.path).toList());
  }

  void insertAtIndexInSelectedStarterTemplate(
      int index, DocumentReference value) {
    _selectedStarterTemplate.insert(index, value);
    prefs.setStringList('ff_selectedStarterTemplate',
        _selectedStarterTemplate.map((x) => x.path).toList());
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
