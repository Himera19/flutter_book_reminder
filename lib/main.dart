import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tech_task/data/services/notification_service.dart';
import 'package:flutter_tech_task/models/book_model.dart';
import 'package:flutter_tech_task/pages/navbar.dart';
import 'package:flutter_tech_task/presentation/providers/book_provider.dart';
import 'package:flutter_tech_task/presentation/providers/favorite_provider.dart';
import 'package:flutter_tech_task/presentation/providers/language_provider.dart';
import 'package:flutter_tech_task/presentation/providers/theme_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox<BookModel>('books');
  final languagesBox = await Hive.openBox('languages');
  final themeBox = await Hive.openBox<bool>('theme');
  final favoritesBox = await Hive.openBox<BookModel>('favorites');
  await NotificationService().init();

  tz.initializeTimeZones();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(themeBox)),
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider(languagesBox)),
        ChangeNotifierProvider(create: (_) => FavoriteProvider(favoritesBox)),
      ],
      child: const MyApp(),
    ),
  );
}

/// Sayfa açılışında çalıştırılacak sayfa.
class MyApp extends StatelessWidget {
  /// Sayfaya benzersiz key ataması.

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          navigatorKey: NotificationService.navigatorKey,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('tr', 'TR'),
            Locale('en', 'US'),
          ],
          locale: languageProvider.currentLocale,
          title: 'Flutter Tech Task',
          theme: context.watch<ThemeProvider>().darkTheme ? dark : light,
          home: const Navbar(),
        );
      },
    );
  }
}