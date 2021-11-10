import 'package:flutter/material.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/pages/qr_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwallet/pages/skillwallet_profile_page.dart';
import 'package:skillwallet/services/LocalStorageService.dart';
import 'package:skillwallet/services/NavigationService.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();

    runApp(const ProviderScope(child: MyApp()));
  } catch (error) {
    print('Locator setup has failed');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tokenID = locator<LocalStorageService>().getTokenID();
    //use this when you want to test the login
    // tokenID = "";
    return MaterialApp(
      title: 'SkillWallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: tokenID.isNotEmpty
          ? SkillWalletProfile(
              tokenID: tokenID,
            )
          : QRWidget(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
