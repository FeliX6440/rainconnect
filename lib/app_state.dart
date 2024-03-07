import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
        '{\"name\":\"Speech to text\",\"description\":\"Take Notes, Summarize and Translate your Thoughts on the go\"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Business card reader\",\"description\":\"Standard Contact Card with integrated Business Card Reader\"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Lead temperature\",\"description\":\"Set your Lead priority and always Know who is more important\"}')),
    TemplateStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Note\",\"description\":\"Simple Text field to take notes\"}'))
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

  bool _componentSwitchState = false;
  bool get componentSwitchState => _componentSwitchState;
  set componentSwitchState(bool value) {
    _componentSwitchState = value;
  }

  List<String> _industryFairContent = [];
  List<String> get industryFairContent => _industryFairContent;
  set industryFairContent(List<String> value) {
    _industryFairContent = value;
  }

  void addToIndustryFairContent(String value) {
    _industryFairContent.add(value);
  }

  void removeFromIndustryFairContent(String value) {
    _industryFairContent.remove(value);
  }

  void removeAtIndexFromIndustryFairContent(int index) {
    _industryFairContent.removeAt(index);
  }

  void updateIndustryFairContentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _industryFairContent[index] = updateFn(_industryFairContent[index]);
  }

  void insertAtIndexInIndustryFairContent(int index, String value) {
    _industryFairContent.insert(index, value);
  }

  String _salesPersonContent = '';
  String get salesPersonContent => _salesPersonContent;
  set salesPersonContent(String value) {
    _salesPersonContent = value;
  }

  String _selectedIndustrialFair = '';
  String get selectedIndustrialFair => _selectedIndustrialFair;
  set selectedIndustrialFair(String value) {
    _selectedIndustrialFair = value;
  }

  String _emailSubjectHolder = '';
  String get emailSubjectHolder => _emailSubjectHolder;
  set emailSubjectHolder(String value) {
    _emailSubjectHolder = value;
  }

  String _emailBodyHolder = '';
  String get emailBodyHolder => _emailBodyHolder;
  set emailBodyHolder(String value) {
    _emailBodyHolder = value;
  }
}
