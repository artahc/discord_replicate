import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:developer';

void main() async {
  var url = "https://1e98-182-253-132-151.ngrok.io";
  var token =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6IjQ3OTg5ZTU4ZWU1ODM4OTgzZDhhNDQwNWRlOTVkYTllZTZmNWVlYjgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZGlzY29yZHJlcGxpY2F0ZSIsImF1ZCI6ImRpc2NvcmRyZXBsaWNhdGUiLCJhdXRoX3RpbWUiOjE2MzkzMjE5NDAsInVzZXJfaWQiOiJGTVliV1B3RldnVHZSZW1oYmJ6MWRMTDlIa0MyIiwic3ViIjoiRk1ZYldQd0ZXZ1R2UmVtaGJiejFkTEw5SGtDMiIsImlhdCI6MTYzOTMyMTk0MCwiZXhwIjoxNjM5MzI1NTQwLCJlbWFpbCI6ImFydGFoY0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsiYXJ0YWhjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.W4QshhhoMPD76alkRA4wR4BMpIeJ0sWsKtzbngQFPBQtRUosQ5WTmuK4_kLZbCvZRjLnXcpDoiHDbJLNx86r238baj1D5i31ijvDtWW1wBUmMh4UwYSTDsYRvAJ9H5ymTzk7qAlJRtO5muzrUFNurC64sq64G1h2aOwPEUCSIg_nhC3B4Vtlage1Zs3oUQ5TUSj3k8OBYMayebl4z-Nv8ZGN2GK6vu0eh0UlISlp6K5BFdjpMzVGgXrzojlNmv5era8FTxxFVO7Y1CLjd839rW6xluJjMRA8kGpDyQZv6BQRMEihuW-kSzRIW_in3qPsjY_GIB2qiYxG6VxFGBHrCQ";
  var _client = GraphQLClientHelper(url: url, tokenProvider: () => Future.value(Credential(uid: "uid", email: "email", token: token)));
  var _serverRepo = ServerRepository(graphQLClient: _client);

  test('Server Repository loadAll()', () async {
    var raw = await _serverRepo.loadAll();
    print("anjayyy");
    log(raw.toString(), name: "[Test]");
  });
}
