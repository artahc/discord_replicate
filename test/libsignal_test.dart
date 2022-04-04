import 'dart:convert';
import 'dart:typed_data';

import 'package:custom_extension/custom_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart' as signal;

class User {
  late signal.IdentityKeyPair identityKeyPair;
  late int registrationId;
  late List<signal.PreKeyRecord> preKeys;
  late signal.SignedPreKeyRecord signedPreKey;
  late signal.SignalProtocolAddress signalProtocolAddress;

  User() {
    identityKeyPair = signal.generateIdentityKeyPair();
    registrationId = signal.generateRegistrationId(false);
    preKeys = signal.generatePreKeys(0, 100);
    signedPreKey = signal.generateSignedPreKey(identityKeyPair, 0);
    signalProtocolAddress = signal.SignalProtocolAddress("my_id", 0);
  }
}

Future main() async {
  test("Test signal encryption", () async {
    // Setup local user
    var localUser = User();
    final localUserSignalProtocolStore = await initializeSignalProtocolStore(localUser);

    // Simulate remote user
    var remoteUser = User();
    final remoteUserSignalProtocolStore = await initializeSignalProtocolStore(remoteUser);

    final localCipher = await createSession(localUserSignalProtocolStore, remoteUser);
    final remoteCipher = await createSession(remoteUserSignalProtocolStore, localUser);

    // Encrypt
    final cipherMessage = await localCipher.encrypt(Uint8List.fromList(utf8.encode("Hello!")));
    print("My cipherText sent to remote user : ${cipherMessage.serialize()}");

    // Decrypt
    var plainMessage =
        await remoteCipher.decrypt(cipherMessage as signal.PreKeySignalMessage).then((value) => value.toPlainString());
    print("My cipherText decrypted by remote user: $plainMessage");

    assert(plainMessage == "Hello!");

    // Encrypt more
    final cipherMessageByRemoteUser = await remoteCipher.encrypt("Hello nice to meet you!".toUint8List());
    print("Remote user cipherText sent to me : ${cipherMessageByRemoteUser.serialize()}");

    final plainMessageByRemoteUser = await localCipher
        .decryptFromSignal(cipherMessageByRemoteUser as signal.SignalMessage)
        .then((value) => value.toPlainString());
    print("Remote user cipherText decrypted by me: $plainMessageByRemoteUser");

    assert(plainMessageByRemoteUser == "Hello nice to meet you!");
  });

  test("Test group message", () async {
    const alice = signal.SignalProtocolAddress('+00000000001', 1);
    const groupSender = signal.SenderKeyName('Private group', alice);
    final aliceStore = signal.InMemorySenderKeyStore();
    final bobStore = signal.InMemorySenderKeyStore();

    final aliceSessionBuilder = signal.GroupSessionBuilder(aliceStore);
    final bobSessionBuilder = signal.GroupSessionBuilder(bobStore);

    final aliceGroupCipher = signal.GroupCipher(aliceStore, groupSender);
    final bobGroupCipher = signal.GroupCipher(bobStore, groupSender);

    final sentAliceDistributionMessage = await aliceSessionBuilder.create(groupSender);
    final receivedAliceDistributionMessage =
        signal.SenderKeyDistributionMessageWrapper.fromSerialized(sentAliceDistributionMessage.serialize());
    await bobSessionBuilder.process(groupSender, receivedAliceDistributionMessage);

    final ciphertextFromAlice = await aliceGroupCipher.encrypt(Uint8List.fromList(utf8.encode('Hello Mixin')));
    final plaintextFromAlice = await bobGroupCipher.decrypt(ciphertextFromAlice);

    print(utf8.decode(plaintextFromAlice));
  });
}

Future<signal.PreKeyBundle> getUserPreKeyBundle(User user) async {
  final preKeyBundle = signal.PreKeyBundle(
    user.registrationId,
    0,
    user.preKeys.first.id,
    user.preKeys.first.getKeyPair().publicKey,
    user.signedPreKey.id,
    user.signedPreKey.getKeyPair().publicKey,
    user.signedPreKey.signature,
    user.identityKeyPair.getPublicKey(),
  );

  return preKeyBundle;
}

Future<signal.SessionCipher> createSession(signal.SignalProtocolStore store, User remoteUser) async {
  final preKeyBundle = await getUserPreKeyBundle(remoteUser);
  final sessionBuilder = signal.SessionBuilder.fromSignalStore(store, remoteUser.signalProtocolAddress);
  await sessionBuilder.processPreKeyBundle(preKeyBundle);

  return signal.SessionCipher.fromStore(store, remoteUser.signalProtocolAddress);
}

Future<signal.SignalProtocolStore> initializeSignalProtocolStore(User user) async {
  var store = signal.InMemorySignalProtocolStore(user.identityKeyPair, user.registrationId);
  for (var key in user.preKeys) {
    await store.storePreKey(key.id, key);
  }
  await store.storeSignedPreKey(user.signedPreKey.id, user.signedPreKey);

  return store;
}
