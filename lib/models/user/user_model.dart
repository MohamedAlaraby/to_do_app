class UserModel{
  //i make this final to prevent the user of this class from
  // modifying the fields he on capable of adding the fields throw constructor(for safety).
  final int id;
  final String name;
  final String number;

  UserModel({required this.id, required this.name, required this.number});
}