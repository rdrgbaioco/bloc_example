import 'package:bloc_example/library.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Example"),
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
            }
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.users.isEmpty) {
                    return const Text("Hi, the list are empty, create a new!!!");
                  }
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: state.users.length,
                      itemExtent: 80.0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            bottom: 8.0,
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text(state.users[index].name),
                            subtitle: Text(state.users[index].email),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(
                                  RemoveUserFromList(
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
                }
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddUserPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
