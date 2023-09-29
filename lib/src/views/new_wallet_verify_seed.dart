import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:veil_wallet/src/core/constants.dart';
import 'package:veil_wallet/src/layouts/mobile/back_layout.dart';
import 'package:veil_wallet/src/views/new_wallet_save_seed.dart';

class NewWalletVerifySeed extends StatelessWidget {
  const NewWalletVerifySeed({super.key});

  @override
  Widget build(BuildContext context) {
    return BackLayout(
        title: AppLocalizations.of(context)?.verifySeedPhraseTitle,
        back: () => {Navigator.of(context).push(_createBackRoute())},
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context)
                              ?.verifySeedPhraseDescription ??
                          stringNotFoundText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 3,
                          childAspectRatio: 2,
                          crossAxisSpacing: 5,
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(24, (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /*Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SizedBox(
                                width: 24, child: Text("${index + 1}."))),*/
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 0.0),
                                    border: const UnderlineInputBorder(),
                                    hintText: '${index + 1}.',
                                  ),
                                ))
                              ],
                            );
                          }),
                        ))),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(45)),
                    onPressed: () {},
                    child: Text(
                        AppLocalizations.of(context)?.createWalletButton ??
                            stringNotFoundText),
                  ),
                ),
              ]),
        ));
  }
}

Route _createBackRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const NewWalletSaveSeed(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
