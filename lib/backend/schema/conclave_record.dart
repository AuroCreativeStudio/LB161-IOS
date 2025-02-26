import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConclaveRecord extends FirestoreRecord {
  ConclaveRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "member_name" field.
  String? _memberName;
  String get memberName => _memberName ?? '';
  bool hasMemberName() => _memberName != null;

  // "lodge_reg_no" field.
  String? _lodgeRegNo;
  String get lodgeRegNo => _lodgeRegNo ?? '';
  bool hasLodgeRegNo() => _lodgeRegNo != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "grand_rank" field.
  String? _grandRank;
  String get grandRank => _grandRank ?? '';
  bool hasGrandRank() => _grandRank != null;

  // "regional_rank" field.
  String? _regionalRank;
  String get regionalRank => _regionalRank ?? '';
  bool hasRegionalRank() => _regionalRank != null;

  // "year1" field.
  String? _year1;
  String get year1 => _year1 ?? '';
  bool hasYear1() => _year1 != null;

  // "year2" field.
  String? _year2;
  String get year2 => _year2 ?? '';
  bool hasYear2() => _year2 != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _memberName = snapshotData['member_name'] as String?;
    _lodgeRegNo = snapshotData['lodge_reg_no'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _grandRank = snapshotData['grand_rank'] as String?;
    _regionalRank = snapshotData['regional_rank'] as String?;
    _year1 = snapshotData['year1'] as String?;
    _year2 = snapshotData['year2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conclave');

  static Stream<ConclaveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConclaveRecord.fromSnapshot(s));

  static Future<ConclaveRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConclaveRecord.fromSnapshot(s));

  static ConclaveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConclaveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConclaveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConclaveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConclaveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConclaveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConclaveRecordData({
  String? title,
  String? memberName,
  String? lodgeRegNo,
  DocumentReference? userRef,
  String? grandRank,
  String? regionalRank,
  String? year1,
  String? year2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'member_name': memberName,
      'lodge_reg_no': lodgeRegNo,
      'userRef': userRef,
      'grand_rank': grandRank,
      'regional_rank': regionalRank,
      'year1': year1,
      'year2': year2,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConclaveRecordDocumentEquality implements Equality<ConclaveRecord> {
  const ConclaveRecordDocumentEquality();

  @override
  bool equals(ConclaveRecord? e1, ConclaveRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.memberName == e2?.memberName &&
        e1?.lodgeRegNo == e2?.lodgeRegNo &&
        e1?.userRef == e2?.userRef &&
        e1?.grandRank == e2?.grandRank &&
        e1?.regionalRank == e2?.regionalRank &&
        e1?.year1 == e2?.year1 &&
        e1?.year2 == e2?.year2;
  }

  @override
  int hash(ConclaveRecord? e) => const ListEquality().hash([
        e?.title,
        e?.memberName,
        e?.lodgeRegNo,
        e?.userRef,
        e?.grandRank,
        e?.regionalRank,
        e?.year1,
        e?.year2
      ]);

  @override
  bool isValidKey(Object? o) => o is ConclaveRecord;
}
