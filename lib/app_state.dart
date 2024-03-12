import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _languageList = [
    'English',
    'French',
    'Chinese',
    'Russian',
    'German',
    'Italian'
  ];
  List<String> get languageList => _languageList;
  set languageList(List<String> _value) {
    _languageList = _value;
  }

  void addToLanguageList(String _value) {
    _languageList.add(_value);
  }

  void removeFromLanguageList(String _value) {
    _languageList.remove(_value);
  }

  void removeAtIndexFromLanguageList(int _index) {
    _languageList.removeAt(_index);
  }

  void updateLanguageListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _languageList[_index] = updateFn(_languageList[_index]);
  }

  void insertAtIndexInLanguageList(int _index, String _value) {
    _languageList.insert(_index, _value);
  }

  String _audioTextResult = '';
  String get audioTextResult => _audioTextResult;
  set audioTextResult(String _value) {
    _audioTextResult = _value;
  }

  List<TemplateStruct> _templates = [
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Speech to text\",\"description\":\"Take Notes, Summarize and Translate your Thoughts on the go\"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Business card reader\",\"description\":\"Standard Contact Card with integrated Business Card Reader\"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Lead temperature\",\"description\":\"Set your Lead priority and always Know who is more important\"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Note\",\"description\":\"Simple Text field to take notes\"}'))
  ];
  List<TemplateStruct> get templates => _templates;
  set templates(List<TemplateStruct> _value) {
    _templates = _value;
  }

  void addToTemplates(TemplateStruct _value) {
    _templates.add(_value);
  }

  void removeFromTemplates(TemplateStruct _value) {
    _templates.remove(_value);
  }

  void removeAtIndexFromTemplates(int _index) {
    _templates.removeAt(_index);
  }

  void updateTemplatesAtIndex(
    int _index,
    TemplateStruct Function(TemplateStruct) updateFn,
  ) {
    _templates[_index] = updateFn(_templates[_index]);
  }

  void insertAtIndexInTemplates(int _index, TemplateStruct _value) {
    _templates.insert(_index, _value);
  }

  bool _componentSwitchState = false;
  bool get componentSwitchState => _componentSwitchState;
  set componentSwitchState(bool _value) {
    _componentSwitchState = _value;
  }

  List<String> _industryFairContent = [];
  List<String> get industryFairContent => _industryFairContent;
  set industryFairContent(List<String> _value) {
    _industryFairContent = _value;
  }

  void addToIndustryFairContent(String _value) {
    _industryFairContent.add(_value);
  }

  void removeFromIndustryFairContent(String _value) {
    _industryFairContent.remove(_value);
  }

  void removeAtIndexFromIndustryFairContent(int _index) {
    _industryFairContent.removeAt(_index);
  }

  void updateIndustryFairContentAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _industryFairContent[_index] = updateFn(_industryFairContent[_index]);
  }

  void insertAtIndexInIndustryFairContent(int _index, String _value) {
    _industryFairContent.insert(_index, _value);
  }

  String _salesPersonContent = '';
  String get salesPersonContent => _salesPersonContent;
  set salesPersonContent(String _value) {
    _salesPersonContent = _value;
  }

  String _selectedIndustrialFair = '';
  String get selectedIndustrialFair => _selectedIndustrialFair;
  set selectedIndustrialFair(String _value) {
    _selectedIndustrialFair = _value;
  }

  String _emailSubjectHolder = '';
  String get emailSubjectHolder => _emailSubjectHolder;
  set emailSubjectHolder(String _value) {
    _emailSubjectHolder = _value;
  }

  String _emailBodyHolder = '';
  String get emailBodyHolder => _emailBodyHolder;
  set emailBodyHolder(String _value) {
    _emailBodyHolder = _value;
  }
}
