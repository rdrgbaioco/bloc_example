import 'package:bloc_example/library.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create User"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 2.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add new user to list",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                ),
                controller: _nameController,
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  hintText: "And your email",
                ),
                controller: _emailController,
              ),
              const SizedBox(height: 60),
              FilledButton(
                style: FilledButton.styleFrom(
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(
                    AddUserToList(
                      name: _nameController.text,
                      email: _emailController.text,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
