class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final List<String> cart;
  final List<String> liked;

  UserData({this.uid, this.name, this.cart, this.liked});
}
