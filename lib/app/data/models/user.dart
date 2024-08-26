class User {
  final String name;
  final String lastName;
  final String? birthDate;
  final String email;
  final String? country;
  final String? county;
  final String? language;
  final String? sex;
  final bool? darkMode;
  final int? level;

  User(
      {required this.name,
      required this.lastName,
      this.birthDate,
      required this.email,
      this.country,
      this.county,
      this.language,
      this.sex,
      this.darkMode,
      this.level});
}
