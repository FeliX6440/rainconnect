import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MarketPlaceRecord extends FirestoreRecord {
  MarketPlaceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "video_link" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  bool hasVideoLink() => _videoLink != null;

  // "bought_by" field.
  List<DocumentReference>? _boughtBy;
  List<DocumentReference> get boughtBy => _boughtBy ?? const [];
  bool hasBoughtBy() => _boughtBy != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _videoLink = snapshotData['video_link'] as String?;
    _boughtBy = getDataList(snapshotData['bought_by']);
    _price = snapshotData['price'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('market_place');

  static Stream<MarketPlaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarketPlaceRecord.fromSnapshot(s));

  static Future<MarketPlaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarketPlaceRecord.fromSnapshot(s));

  static MarketPlaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MarketPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarketPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarketPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarketPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarketPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarketPlaceRecordData({
  String? title,
  String? description,
  String? videoLink,
  String? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'video_link': videoLink,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarketPlaceRecordDocumentEquality implements Equality<MarketPlaceRecord> {
  const MarketPlaceRecordDocumentEquality();

  @override
  bool equals(MarketPlaceRecord? e1, MarketPlaceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.videoLink == e2?.videoLink &&
        listEquality.equals(e1?.boughtBy, e2?.boughtBy) &&
        e1?.price == e2?.price;
  }

  @override
  int hash(MarketPlaceRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.videoLink, e?.boughtBy, e?.price]);

  @override
  bool isValidKey(Object? o) => o is MarketPlaceRecord;
}
