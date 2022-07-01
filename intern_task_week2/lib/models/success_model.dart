class Success {
  final String namePerId;
  final String name;
  final String id;
  final String dob;
  final String gender;
  final String email;
  final String madenName;
  final String? promo;
  final String phone;
  Success({
    required this.namePerId,
    required this.name,
    required this.id,
    required this.dob,
    required this.gender,
    required this.email,
    required this.madenName,
    this.promo,
    required this.phone,
  });

  @override
  String toString() {
    return 'Success(namePerId: $namePerId, name: $name, id: $id, dob: $dob, gender: $gender, email: $email, madenName: $madenName, promo: $promo, phone: $phone)';
  }
}
