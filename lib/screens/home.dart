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

    store.getData();
  }

  @override
  Widget build(BuildContext context) {
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
        body: ListenableBuilder(
          listenable: store,
          builder: (context, child) {
            final state = store.dataState;

            return switch (state) {
              Loading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              Loaded() => ListView.builder(
                  itemCount: state.users!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.yellow,
                      margin: const EdgeInsets.all(12.0),
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
                                  state.users![index].id.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  state.users![index].name,
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
                                  state.users![index].email,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    //color: Colors.black,
                                  ),
                                ),
                                Text(
                                  state.users![index].website,
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
                ),
              Error() => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não foi possível carregador os dados',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: () => store.getData(), child: const Text('Tente novamente')),
                    ],
                  ),
                )
            };
          },
        ),
      ),
    );
  }
}
