import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart' as signal;
import 'package:tuple/tuple.dart';

Future main() async {
  test("Test signal encryption", () async {
    await install();
  });

  test("Example", () async {
    await example();
  });
}

Future<void> install() async {
  // Generate key bundles
  final identityKeyPair = signal.generateIdentityKeyPair();
  final registrationId = signal.generateRegistrationId(false);
  final preKeys = signal.generatePreKeys(0, 100);
  final signedPreKey = signal.generateSignedPreKey(identityKeyPair, 0);

  final sessionStore = signal.InMemorySessionStore();
  final preKeyStore = signal.InMemoryPreKeyStore();
  final signedPreKeyStore = signal.InMemorySignedPreKeyStore();
  final identityKeyStore = signal.InMemoryIdentityKeyStore(identityKeyPair, registrationId);

  // Store Keys
  for (var key in preKeys) {
    await preKeyStore.storePreKey(key.id, key);
  }
  await signedPreKeyStore.storeSignedPreKey(signedPreKey.id, signedPreKey);

  // Me as client
  final remoteAddress = signal.SignalProtocolAddress("remote_address", 0);
  final sessionBuilder = signal.SessionBuilder(sessionStore, preKeyStore, signedPreKeyStore, identityKeyStore, remoteAddress);

  var remoteResource = await getRemoteUserPrequisiteResource();
  await sessionBuilder.processPreKeyBundle(remoteResource.item5);

  final sessionCipher = signal.SessionCipher(sessionStore, preKeyStore, signedPreKeyStore, identityKeyStore, remoteAddress);
  final cipherText = await sessionCipher.encrypt(Uint8List.fromList(utf8.encode("Hello!")));
  print(cipherText.serialize());

  // Receiver
  final signalProtocolStore = signal.InMemorySignalProtocolStore(remoteResource.item2, remoteResource.item1);
  final myAddress = signal.SignalProtocolAddress("my_address", 0);
  final remoteSessionCipher = signal.SessionCipher.fromStore(signalProtocolStore, myAddress);
  for (var key in remoteResource.item3) {
    signalProtocolStore.storePreKey(key.id, key);
  }
  await signalProtocolStore.storeSignedPreKey(remoteResource.item4.id, remoteResource.item4);

  var plainText = await remoteSessionCipher.decrypt(cipherText as signal.PreKeySignalMessage);
  print(utf8.decode(plainText));
}

Future<Tuple5<int, signal.IdentityKeyPair, List<signal.PreKeyRecord>, signal.SignedPreKeyRecord, signal.PreKeyBundle>>
    getRemoteUserPrequisiteResource() async {
  final registrationId = signal.generateRegistrationId(false);
  final identityKeyPair = signal.generateIdentityKeyPair();
  final preKeys = signal.generatePreKeys(0, 100);
  final signedPreKey = signal.generateSignedPreKey(identityKeyPair, 0);

  final preKeyBundle = signal.PreKeyBundle(
    registrationId,
    5,
    preKeys.first.id,
    preKeys.first.getKeyPair().publicKey,
    signedPreKey.id,
    signedPreKey.getKeyPair().publicKey,
    signedPreKey.signature,
    identityKeyPair.getPublicKey(),
  );

  return Tuple5(registrationId, identityKeyPair, preKeys, signedPreKey, preKeyBundle);
}

Future<void> example() async {
  final identityKeyPair = signal.generateIdentityKeyPair();
  final registrationId = signal.generateRegistrationId(false);

  final preKeys = signal.generatePreKeys(0, 110);

  final signedPreKey = signal.generateSignedPreKey(identityKeyPair, 0);

  final sessionStore = signal.InMemorySessionStore();
  final preKeyStore = signal.InMemoryPreKeyStore();
  final signedPreKeyStore = signal.InMemorySignedPreKeyStore();
  final identityStore = signal.InMemoryIdentityKeyStore(identityKeyPair, registrationId);

  for (final p in preKeys) {
    await preKeyStore.storePreKey(p.id, p);
  }
  await signedPreKeyStore.storeSignedPreKey(signedPreKey.id, signedPreKey);

  const bobAddress = signal.SignalProtocolAddress('bob', 1);
  final sessionBuilder = signal.SessionBuilder(sessionStore, preKeyStore, signedPreKeyStore, identityStore, bobAddress);

  // Should get remote from the server
  final remoteRegId = signal.generateRegistrationId(false);
  final remoteIdentityKeyPair = signal.generateIdentityKeyPair();
  final remotePreKeys = signal.generatePreKeys(0, 110);
  final remoteSignedPreKey = signal.generateSignedPreKey(remoteIdentityKeyPair, 0);

  final retrievedPreKey = signal.PreKeyBundle(remoteRegId, 1, remotePreKeys[0].id, remotePreKeys[0].getKeyPair().publicKey, remoteSignedPreKey.id,
      remoteSignedPreKey.getKeyPair().publicKey, remoteSignedPreKey.signature, remoteIdentityKeyPair.getPublicKey());

  await sessionBuilder.processPreKeyBundle(retrievedPreKey);

  final sessionCipher = signal.SessionCipher(sessionStore, preKeyStore, signedPreKeyStore, identityStore, bobAddress);
  final ciphertext = await sessionCipher.encrypt(Uint8List.fromList(utf8.encode('Hello Mixin🤣')));
  // ignore: avoid_print
  print(ciphertext);
  // ignore: avoid_print
  print(ciphertext.serialize());
  //deliver(ciphertext);

  final signalProtocolStore = signal.InMemorySignalProtocolStore(remoteIdentityKeyPair, 1);
  const aliceAddress = signal.SignalProtocolAddress('alice', 1);
  final remoteSessionCipher = signal.SessionCipher.fromStore(signalProtocolStore, aliceAddress);

  for (final p in remotePreKeys) {
    await signalProtocolStore.storePreKey(p.id, p);
  }
  await signalProtocolStore.storeSignedPreKey(remoteSignedPreKey.id, remoteSignedPreKey);

  if (ciphertext.getType() == signal.CiphertextMessage.prekeyType) {
    await remoteSessionCipher.decryptWithCallback(ciphertext as signal.PreKeySignalMessage, (plaintext) {
      // ignore: avoid_print
      print(utf8.decode(plaintext));
    });
  }
}
