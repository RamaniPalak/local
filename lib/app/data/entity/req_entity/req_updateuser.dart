

class ReqUpdateUser {
  ReqUpdateUser({
    this.memberId,
    this.firstName,
    this.lastName,
    this.eMail,
  });

  String? memberId;
  String? firstName;
  String? lastName;
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
    "LastName": lastName == null ? null : lastName,
  };
}
