import 'package:bloc_example/library.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'BloC Example',
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          themeAnimationCurve: Curves.easeInOut,
          themeAnimationDuration: const Duration(seconds: 1),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: Colors.blueAccent,
            ),
            listTileTheme: ListTileThemeData(
              tileColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: Colors.blueAccent,
            ),
            listTileTheme: ListTileThemeData(
              tileColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          home: const HomePage(),
        );
      }
    );
  }
}