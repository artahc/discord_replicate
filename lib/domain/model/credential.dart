class Credential {
  final String uid;
  final String email;
  final String token;

  const Credential({required this.uid, required this.email, required this.token});

  factory Credential.empty() => const Credential(uid: "", email: "", token: "");

  Map<String, dynamic> toJson() {
    return {"uid": uid, "email": email, "token": token};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
