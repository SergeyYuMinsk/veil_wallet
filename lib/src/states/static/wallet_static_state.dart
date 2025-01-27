import 'package:veil_light_plugin/veil_light.dart';

class WalletEntry {
  String name;
  int id;

  WalletEntry(this.name, this.id);
}

class WalletStaticState {
  static List<WalletEntry>? wallets;
  static int activeWallet = -1;
  static Lightwallet? lightwallet;
  static LightwalletAccount? account;

  static bool walletWatching = false;
  static double conversionRate = 0.0;

  static String? deepLinkTargetAddress;
  static String? deepLinkTargetAmount;
}
