enum Status { LOADING, COMPLETED, ERROR, UNAUTHORISED }


//Gender Setup
enum Gender { OTHERS, FEMALE, MALE, NONE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE,
  "other": Gender.OTHERS,
  "none": Gender.NONE
});

enum MessageTerm {FrontDesk,User}

enum HousekeepingTerm {Minimal,Full}

final housekeepingValues = EnumValues({
  "Minimal": HousekeepingTerm.Minimal,
  "Full": HousekeepingTerm.Full,

});

enum DndTerm {MarkAsDND,Dirty}

final dndTermValue = EnumValues<DndTerm>({
  'MarkAsDND' : DndTerm.MarkAsDND,
  'Dirty' : DndTerm.Dirty,

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


enum DocumentTitleTerm {AadharCard,DrivingLicense,EmployeeCard}

final documentTitleValue = EnumValues<DocumentTitleTerm>({

  'Aadhar Card' : DocumentTitleTerm.AadharCard,
  'Driving License' : DocumentTitleTerm.DrivingLicense,
  'Employee Card' :DocumentTitleTerm.EmployeeCard
});


enum HistoryStatus {CheckIn,CheckOut,Cancelled}

final historyStatusValue = EnumValues<HistoryStatus>({

  'CheckIn' : HistoryStatus.CheckIn,
  'CheckOut' : HistoryStatus.CheckOut,
  'Cancelled' :HistoryStatus.Cancelled

});

enum ComplainPriorityStatus {High,Medium,Low}

final complainPriorityStatusValue = EnumValues<ComplainPriorityStatus>({
  'High': ComplainPriorityStatus.High,
  'Medium': ComplainPriorityStatus.Medium,
  'Low': ComplainPriorityStatus.Low

}) ;

enum ComplainStatus {Open,Close}

final complainStatusValue = EnumValues<ComplainStatus>({

  'Open':ComplainStatus.Open,
  'Close': ComplainStatus.Close
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
