import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfessionRecord extends FirestoreRecord {
  ProfessionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city_of_residence" field.
  String? _cityOfResidence;
  String get cityOfResidence => _cityOfResidence ?? '';
  bool hasCityOfResidence() => _cityOfResidence != null;

  // "native_city" field.
  String? _nativeCity;
  String get nativeCity => _nativeCity ?? '';
  bool hasNativeCity() => _nativeCity != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "city_operations" field.
  String? _cityOperations;
  String get cityOperations => _cityOperations ?? '';
  bool hasCityOperations() => _cityOperations != null;

  // "profession_name" field.
  String? _professionName;
  String get professionName => _professionName ?? '';
  bool hasProfessionName() => _professionName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "pin_code" field.
  String? _pinCode;
  String get pinCode => _pinCode ?? '';
  bool hasPinCode() => _pinCode != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "gst_number" field.
  String? _gstNumber;
  String get gstNumber => _gstNumber ?? '';
  bool hasGstNumber() => _gstNumber != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  void _initializeFields() {
    _cityOfResidence = snapshotData['city_of_residence'] as String?;
    _nativeCity = snapshotData['native_city'] as String?;
    _surname = snapshotData['surname'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _categories = snapshotData['categories'] as String?;
    _cityOperations = snapshotData['city_operations'] as String?;
    _professionName = snapshotData['profession_name'] as String?;
    _address = snapshotData['address'] as String?;
    _pinCode = snapshotData['pin_code'] as String?;
    _state = snapshotData['state'] as String?;
    _gstNumber = snapshotData['gst_number'] as String?;
    _address2 = snapshotData['address2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profession');

  static Stream<ProfessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfessionRecord.fromSnapshot(s));

  static Future<ProfessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfessionRecord.fromSnapshot(s));

  static ProfessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfessionRecordData({
  String? cityOfResidence,
  String? nativeCity,
  String? surname,
  DocumentReference? userRef,
  String? categories,
  String? cityOperations,
  String? professionName,
  String? address,
  String? pinCode,
  String? state,
  String? gstNumber,
  String? address2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_of_residence': cityOfResidence,
      'native_city': nativeCity,
      'surname': surname,
      'userRef': userRef,
      'categories': categories,
      'city_operations': cityOperations,
      'profession_name': professionName,
      'address': address,
      'pin_code': pinCode,
      'state': state,
      'gst_number': gstNumber,
      'address2': address2,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfessionRecordDocumentEquality implements Equality<ProfessionRecord> {
  const ProfessionRecordDocumentEquality();

  @override
  bool equals(ProfessionRecord? e1, ProfessionRecord? e2) {
    return e1?.cityOfResidence == e2?.cityOfResidence &&
        e1?.nativeCity == e2?.nativeCity &&
        e1?.surname == e2?.surname &&
        e1?.userRef == e2?.userRef &&
        e1?.categories == e2?.categories &&
        e1?.cityOperations == e2?.cityOperations &&
        e1?.professionName == e2?.professionName &&
        e1?.address == e2?.address &&
        e1?.pinCode == e2?.pinCode &&
        e1?.state == e2?.state &&
        e1?.gstNumber == e2?.gstNumber &&
        e1?.address2 == e2?.address2;
  }

  @override
  int hash(ProfessionRecord? e) => const ListEquality().hash([
        e?.cityOfResidence,
        e?.nativeCity,
        e?.surname,
        e?.userRef,
        e?.categories,
        e?.cityOperations,
        e?.professionName,
        e?.address,
        e?.pinCode,
        e?.state,
        e?.gstNumber,
        e?.address2
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfessionRecord;
}
