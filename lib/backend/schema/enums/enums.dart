import 'package:collection/collection.dart';

enum Gender {
  male,
  female,
  others,
}

enum ComponentType {
  Dropdown,
  MultipleChoice,
  TextField,
  SpeechToText,
  Note,
  Temperature,
  placeOfEncounter,
  industrialFair,
}

enum TemplateMode {
  industry,
  salesPerson,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (ComponentType):
      return ComponentType.values.deserialize(value) as T?;
    case (TemplateMode):
      return TemplateMode.values.deserialize(value) as T?;
    default:
      return null;
  }
}
