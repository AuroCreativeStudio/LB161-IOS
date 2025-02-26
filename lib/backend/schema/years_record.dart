import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YearsRecord extends FirestoreRecord {
  YearsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _year = snapshotData['Year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('years');

  static Stream<YearsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YearsRecord.fromSnapshot(s));

  static Future<YearsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YearsRecord.fromSnapshot(s));

  static YearsRecord fromSnapshot(DocumentSnapshot snapshot) => YearsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YearsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YearsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YearsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YearsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYearsRecordData({
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class YearsRecordDocumentEquality implements Equality<YearsRecord> {
  const YearsRecordDocumentEquality();

  @override
  bool equals(YearsRecord? e1, YearsRecord? e2) {
    return e1?.year == e2?.year;
  }

  @override
  int hash(YearsRecord? e) => const ListEquality().hash([e?.year]);

  @override
  bool isValidKey(Object? o) => o is YearsRecord;
}
