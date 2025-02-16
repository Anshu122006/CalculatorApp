class History {
  History({this.id, this.exp, this.res});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      exp: json['exp'],
      res: json['res'],
    );
  }
  int? id;
  String? exp;
  String? res;

  Map<String, dynamic> toMap() {
    return {"exp": exp, "res": res};
  }
}
