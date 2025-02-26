import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessRecord extends FirestoreRecord {
  BusinessRecord._(
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

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "women_owned" field.
  String? _womenOwned;
  String get womenOwned => _womenOwned ?? '';
  bool hasWomenOwned() => _womenOwned != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

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

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "operations_city" field.
  String? _operationsCity;
  String get operationsCity => _operationsCity ?? '';
  bool hasOperationsCity() => _operationsCity != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _cityOfResidence = snapshotData['city_of_residence'] as String?;
    _nativeCity = snapshotData['native_city'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _categories = snapshotData['categories'] as String?;
    _womenOwned = snapshotData['women_owned'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _address = snapshotData['address'] as String?;
    _pinCode = snapshotData['pin_code'] as String?;
    _state = snapshotData['state'] as String?;
    _gstNumber = snapshotData['gst_number'] as String?;
    _surname = snapshotData['surname'] as String?;
    _operationsCity = snapshotData['operations_city'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business');

  static Stream<BusinessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessRecord.fromSnapshot(s));

  static Future<BusinessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessRecord.fromSnapshot(s));

  static BusinessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessRecordData({
  String? cityOfResidence,
  String? nativeCity,
  DocumentReference? userRef,
  String? categories,
  String? womenOwned,
  String? businessName,
  String? address,
  String? pinCode,
  String? state,
  String? gstNumber,
  String? surname,
  String? operationsCity,
  String? address2,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_of_residence': cityOfResidence,
      'native_city': nativeCity,
      'userRef': userRef,
      'categories': categories,
      'women_owned': womenOwned,
      'business_name': businessName,
      'address': address,
      'pin_code': pinCode,
      'state': state,
      'gst_number': gstNumber,
      'surname': surname,
      'operations_city': operationsCity,
      'address2': address2,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessRecordDocumentEquality implements Equality<BusinessRecord> {
  const BusinessRecordDocumentEquality();

  @override
  bool equals(BusinessRecord? e1, BusinessRecord? e2) {
    return e1?.cityOfResidence == e2?.cityOfResidence &&
        e1?.nativeCity == e2?.nativeCity &&
        e1?.userRef == e2?.userRef &&
        e1?.categories == e2?.categories &&
        e1?.womenOwned == e2?.womenOwned &&
        e1?.businessName == e2?.businessName &&
        e1?.address == e2?.address &&
        e1?.pinCode == e2?.pinCode &&
        e1?.state == e2?.state &&
        e1?.gstNumber == e2?.gstNumber &&
        e1?.surname == e2?.surname &&
        e1?.operationsCity == e2?.operationsCity &&
        e1?.address2 == e2?.address2 &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(BusinessRecord? e) => const ListEquality().hash([
        e?.cityOfResidence,
        e?.nativeCity,
        e?.userRef,
        e?.categories,
        e?.womenOwned,
        e?.businessName,
        e?.address,
        e?.pinCode,
        e?.state,
        e?.gstNumber,
        e?.surname,
        e?.operationsCity,
        e?.address2,
        e?.photo
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessRecord;
}
