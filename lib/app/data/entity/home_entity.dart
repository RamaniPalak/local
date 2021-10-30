class Welcome {
  Welcome({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory Welcome.fromJson(Map<String, dynamic>? json) {

    if (json != null) {
      try{
        return Welcome(
          userId: json["userId"],
          id: json["id"],
          title: json["title"],
          completed: json["completed"],
        );
      }catch(e){
        throw 'Unexpected response.';
      }

    } else {
      throw '';
    }
  }
}
