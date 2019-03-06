class Result{
  int code;
  Result({this.code});

  factory Result.fromJson(Map<String, dynamic> parsedJson){
    return Result(code: parsedJson["code"]);
  }
}