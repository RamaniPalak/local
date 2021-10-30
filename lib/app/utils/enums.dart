enum Status { LOADING, COMPLETED, ERROR, UNAUTHORISED }

//Address
enum AddressType{
  CURRENT, PERMANENT
}

final addressValues = EnumValues({
  "current": AddressType.CURRENT,
  "permanent": AddressType.PERMANENT
});


//Gender Setup
enum Gender { OTHERS, FEMALE, MALE, NONE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE,
  "other": Gender.OTHERS,
  "none": Gender.NONE
});


enum NoticeTypeTerm {Checkout,Extension,MoveRoom}

final noticeTypeTermValue = EnumValues<NoticeTypeTerm>({
  'Checkout' : NoticeTypeTerm.Checkout,
  'Extension' : NoticeTypeTerm.Extension,
  'MoveRoom' : NoticeTypeTerm.MoveRoom,

});


enum NoticeStatusTerm {Open,Approved,Closed}

final statusTermValue = EnumValues<NoticeStatusTerm>({
  'Open' : NoticeStatusTerm.Open,
  'Approved' : NoticeStatusTerm.Approved,
  'Closed' : NoticeStatusTerm.Closed,
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
