class Credential {
  final String uid;
  final String email;
  final String token;

  Credential({required this.uid, required this.email, required this.token});

  Map<String, dynamic> toJson() {
    return {"uid": uid, "email": email, "token": token};
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
