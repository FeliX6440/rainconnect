// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TemplateStruct extends FFFirebaseStruct {
  TemplateStruct({
    String? name,
    String? description,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static TemplateStruct fromMap(Map<String, dynamic> data) => TemplateStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        id: data['id'] as String?,
      );

  static TemplateStruct? maybeFromMap(dynamic data) =>
      data is Map ? TemplateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static TemplateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TemplateStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TemplateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TemplateStruct &&
        name == other.name &&
        description == other.description &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, description, id]);
}

TemplateStruct createTemplateStruct({
  String? name,
  String? description,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TemplateStruct(
      name: name,
      description: description,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TemplateStruct? updateTemplateStruct(
  TemplateStruct? template, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    template
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTemplateStructData(
  Map<String, dynamic> firestoreData,
  TemplateStruct? template,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (template == null) {
    return;
  }
  if (template.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && template.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final templateData = getTemplateFirestoreData(template, forFieldValue);
  final nestedData = templateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = template.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTemplateFirestoreData(
  TemplateStruct? template, [
  bool forFieldValue = false,
]) {
  if (template == null) {
    return {};
  }
  final firestoreData = mapToFirestore(template.toMap());

  // Add any Firestore field values
  template.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTemplateListFirestoreData(
  List<TemplateStruct>? templates,
) =>
    templates?.map((e) => getTemplateFirestoreData(e, true)).toList() ?? [];
