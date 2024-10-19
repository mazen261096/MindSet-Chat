enum RequestState{
  loading,
  loaded,
  error,

}


enum UserType{
  user,
  manager,
  dealer;

  static UserType fromJson(String json) => values.byName(json);

}