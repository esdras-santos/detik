import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;

import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';
import 'ecurve.dart' as ecc;

class Node {
  late bip32.BIP32 node;
  Node(String _nickName, String _password) {
    String seed = bip39.mnemonicToSeedHex(_nickName+_password);  
    node = bip32.BIP32.fromSeed(Uint8List.fromList(HEX.decode(seed)));
  }

  bool verify(Uint8List eventId, Uint8List pubkey, Uint8List sig) {
    return ecc.verify(eventId, pubkey, sig);
  }

  dynamic sign(Uint8List eventId) {
    return node.sign(Uint8List.fromList(eventId));
  }

}

