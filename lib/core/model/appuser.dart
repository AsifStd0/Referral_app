class AppUser {
  String? firstName;
  String? udid;
  String? lastName;
  String? email;
  String? address;
  String? phoneNumber;
  String? company;
  bool? verified;
  bool w9Form;
  int? avgJobValue;
  int? refferals;
  String? accepted;
  String? avatar;
  String? jobTittle;
  String? password;

  AppUser(
      {required this.address,
      required this.accepted,
      required this.password,
      required this.avatar,
      required this.company,
      required this.jobTittle,
      required this.email,
      required this.verified,
      required this.udid,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.w9Form,
      required this.avgJobValue,
      required this.refferals});
}

AppUser? user;
