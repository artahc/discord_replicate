import 'dart:convert';

void main() {
  var jsonString = """
    {
      "__typename":"MessageType",
      "id":"f2bfb31e-aa3e-4195-8c5f-e29ce853d4ea",
      "senderRef":"FMYbWPwFWgTvRemhbbz1dLL9HkC2",
      "timestamp":1648332198596,
      "message":"we"
    }
  """;

  Map<String, dynamic> json = jsonDecode(jsonString);
    
}
