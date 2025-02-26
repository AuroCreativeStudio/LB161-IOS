import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BloodDonateRecord extends FirestoreRecord {
  BloodDonateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blood_group" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  bool hasBloodGroup() => _bloodGroup != null;

  void _initializeFields() {
    _bloodGroup = snapshotData['blood_group'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blood_donate');

  static Stream<BloodDonateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BloodDonateRecord.fromSnapshot(s));

  static Future<BloodDonateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BloodDonateRecord.fromSnapshot(s));

  static BloodDonateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BloodDonateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BloodDonateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BloodDonateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BloodDonateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BloodDonateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBloodDonateRecordData({
  String? bloodGroup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blood_group': bloodGroup,
    }.withoutNulls,
  );

  return firestoreData;
}

class BloodDonateRecordDocumentEquality implements Equality<BloodDonateRecord> {
  const BloodDonateRecordDocumentEquality();

  @override
  bool equals(BloodDonateRecord? e1, BloodDonateRecord? e2) {
    return e1?.bloodGroup == e2?.bloodGroup;
  }

  @override
  int hash(BloodDonateRecord? e) => const ListEquality().hash([e?.bloodGroup]);

  @override
  bool isValidKey(Object? o) => o is BloodDonateRecord;
}
