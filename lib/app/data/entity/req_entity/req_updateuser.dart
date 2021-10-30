

class ReqUpdateUser {
  ReqUpdateUser({
    this.memberId,
    this.firstName,
    this.eMail,
  });

  String? memberId;
  String? firstName;
  String? eMail;

  factory ReqUpdateUser.fromJson(Map<String, dynamic> json) => ReqUpdateUser(
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    firstName: json["FirstName"] == null ? null : json["FirstName"],
    eMail: json["EMail"] == null ? null : json["EMail"],
  );

  Map<String, dynamic> toJson() => {
    "MemberID": memberId == null ? null : memberId,
    "FirstName": firstName == null ? null : firstName,
    "EMail": eMail == null ? null : eMail,
  };
}
