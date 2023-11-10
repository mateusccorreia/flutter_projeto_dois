import 'package:flutter/material.dart';
import 'package:flutter_projeto_dois/user_store.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final store = UserStore();

  @override
  void initState() {
    super.initState();

    store.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userModel = _userModel;

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('REST API - Mateus'),
        ),
        backgroundColor: Colors.purple,
        body: () {
          if (store.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.error.isEmpty) {
            return const Center(
              child: Text('Lista de usuários vazia'),
            );
          } else if (store.error.isNotEmpty) {
            return Center(
              child: Text(store.error),
            );
          } else {
            return ListView.builder(
              itemCount: store.userModel?.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(12.0),
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              store.userModel![index].id.toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              store.userModel![index].name,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              store.userModel![index].email,
                              style: const TextStyle(
                                fontSize: 18,
                                //color: Colors.black,
                              ),
                            ),
                            Text(
                              store.userModel![index].website,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }(),
      ),
    );
  }
}

// enum AppState {
//   loading,
//   loaded,
//   error,
// }
