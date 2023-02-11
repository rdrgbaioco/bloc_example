import 'package:bloc_example/library.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
        actions: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(
                    ChangeAppTheme(
                      themeMode: state.themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    ),
                  );
                },
                icon: state.themeMode == ThemeMode.light
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.users.isEmpty) {
                  return const Text('Hi, the list are empty, create a new!!!');
                }
                return Flexible(
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemExtent: 80,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 8,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text(state.users[index].name),
                          subtitle: Text(state.users[index].email),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(
                                RemoveUser(
                                  index: index,
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (context) => const AddUserPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
