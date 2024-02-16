import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedBannerRecord extends FirestoreRecord {
  SelectedBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "selectedBanner" field.
  String? _selectedBanner;
  String get selectedBanner => _selectedBanner ?? '';
  bool hasSelectedBanner() => _selectedBanner != null;

  void _initializeFields() {
    _selectedBanner = snapshotData['selectedBanner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('selectedBanner');

  static Stream<SelectedBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SelectedBannerRecord.fromSnapshot(s));

  static Future<SelectedBannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SelectedBannerRecord.fromSnapshot(s));

  static SelectedBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SelectedBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SelectedBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SelectedBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SelectedBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SelectedBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSelectedBannerRecordData({
  String? selectedBanner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'selectedBanner': selectedBanner,
    }.withoutNulls,
  );

  return firestoreData;
}

class SelectedBannerRecordDocumentEquality
    implements Equality<SelectedBannerRecord> {
  const SelectedBannerRecordDocumentEquality();

  @override
  bool equals(SelectedBannerRecord? e1, SelectedBannerRecord? e2) {
    return e1?.selectedBanner == e2?.selectedBanner;
  }

  @override
  int hash(SelectedBannerRecord? e) =>
      const ListEquality().hash([e?.selectedBanner]);

  @override
  bool isValidKey(Object? o) => o is SelectedBannerRecord;
}
