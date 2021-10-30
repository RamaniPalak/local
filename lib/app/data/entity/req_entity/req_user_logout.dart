
class ReqUserLogout {
  ReqUserLogout({
    this.userId,
  });

  int? userId;

  Map<String, dynamic> toJson() => {
    "UserID": userId,
  };
}
