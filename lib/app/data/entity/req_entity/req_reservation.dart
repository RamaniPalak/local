

class ReqReservation {
  ReqReservation({
    this.memberId,
  });

  String? memberId;

  factory ReqReservation.fromJson(Map<String, dynamic> json) => ReqReservation(
    memberId: json["MemberID"] == null ? null : json["MemberID"],
  );

  Map<String, dynamic> toJson() => {
    "MemberID": memberId == null ? null : memberId,
  };
}

