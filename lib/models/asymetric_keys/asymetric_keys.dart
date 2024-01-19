import 'package:hive/hive.dart';
import 'package:pointycastle/api.dart';
part 'asymetric_keys.g.dart';

// This model is created to save Asymmetric Keys to the Hive as Hive doesn't allow to store objects other than Arrays, List, int, Strings etc.
@HiveType(typeId: 7)
/// Hive Type for [AssymetricKeys].
class AsymetricKeys extends HiveObject {
  AsymetricKeys({required this.keyPair});
  @HiveField(0)

  /// The key pair to work with.
  final AsymmetricKeyPair<PublicKey, PrivateKey> keyPair;
}
