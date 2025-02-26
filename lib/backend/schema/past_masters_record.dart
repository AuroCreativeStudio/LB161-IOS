import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PastMastersRecord extends FirestoreRecord {
  PastMastersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _year = snapshotData['year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('past_masters');

  static Stream<PastMastersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PastMastersRecord.fromSnapshot(s));

  static Future<PastMastersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PastMastersRecord.fromSnapshot(s));

  static PastMastersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PastMastersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PastMastersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PastMastersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PastMastersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PastMastersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPastMastersRecordData({
  String? name,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class PastMastersRecordDocumentEquality implements Equality<PastMastersRecord> {
  const PastMastersRecordDocumentEquality();

  @override
  bool equals(PastMastersRecord? e1, PastMastersRecord? e2) {
    return e1?.name == e2?.name && e1?.year == e2?.year;
  }

  @override
  int hash(PastMastersRecord? e) =>
      const ListEquality().hash([e?.name, e?.year]);

  @override
  bool isValidKey(Object? o) => o is PastMastersRecord;
}
