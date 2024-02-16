import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaxillDoctorsRecord extends FirestoreRecord {
  MaxillDoctorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobName" field.
  String? _jobName;
  String get jobName => _jobName ?? '';
  bool hasJobName() => _jobName != null;

  // "jobDescription" field.
  String? _jobDescription;
  String get jobDescription => _jobDescription ?? '';
  bool hasJobDescription() => _jobDescription != null;

  // "drNumber" field.
  String? _drNumber;
  String get drNumber => _drNumber ?? '';
  bool hasDrNumber() => _drNumber != null;

  // "drPhoto" field.
  String? _drPhoto;
  String get drPhoto => _drPhoto ?? '';
  bool hasDrPhoto() => _drPhoto != null;

  void _initializeFields() {
    _jobName = snapshotData['jobName'] as String?;
    _jobDescription = snapshotData['jobDescription'] as String?;
    _drNumber = snapshotData['drNumber'] as String?;
    _drPhoto = snapshotData['drPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maxill_doctors');

  static Stream<MaxillDoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaxillDoctorsRecord.fromSnapshot(s));

  static Future<MaxillDoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaxillDoctorsRecord.fromSnapshot(s));

  static MaxillDoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaxillDoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaxillDoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaxillDoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaxillDoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaxillDoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaxillDoctorsRecordData({
  String? jobName,
  String? jobDescription,
  String? drNumber,
  String? drPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobName': jobName,
      'jobDescription': jobDescription,
      'drNumber': drNumber,
      'drPhoto': drPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaxillDoctorsRecordDocumentEquality
    implements Equality<MaxillDoctorsRecord> {
  const MaxillDoctorsRecordDocumentEquality();

  @override
  bool equals(MaxillDoctorsRecord? e1, MaxillDoctorsRecord? e2) {
    return e1?.jobName == e2?.jobName &&
        e1?.jobDescription == e2?.jobDescription &&
        e1?.drNumber == e2?.drNumber &&
        e1?.drPhoto == e2?.drPhoto;
  }

  @override
  int hash(MaxillDoctorsRecord? e) => const ListEquality()
      .hash([e?.jobName, e?.jobDescription, e?.drNumber, e?.drPhoto]);

  @override
  bool isValidKey(Object? o) => o is MaxillDoctorsRecord;
}
