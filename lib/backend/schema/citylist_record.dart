import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitylistRecord extends FirestoreRecord {
  CitylistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "category_name" field.
  DocumentReference? _categoryName;
  DocumentReference? get categoryName => _categoryName;
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _categoryName = snapshotData['category_name'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citylist');

  static Stream<CitylistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitylistRecord.fromSnapshot(s));

  static Future<CitylistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitylistRecord.fromSnapshot(s));

  static CitylistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CitylistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitylistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitylistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitylistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitylistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitylistRecordData({
  String? city,
  DocumentReference? categoryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'category_name': categoryName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitylistRecordDocumentEquality implements Equality<CitylistRecord> {
  const CitylistRecordDocumentEquality();

  @override
  bool equals(CitylistRecord? e1, CitylistRecord? e2) {
    return e1?.city == e2?.city && e1?.categoryName == e2?.categoryName;
  }

  @override
  int hash(CitylistRecord? e) =>
      const ListEquality().hash([e?.city, e?.categoryName]);

  @override
  bool isValidKey(Object? o) => o is CitylistRecord;
}
