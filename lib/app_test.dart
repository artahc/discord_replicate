import 'dart:math';

import 'package:discord_replicate/presentation/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Model {
  final String id;
  final String name;

  Model(this.id, this.name);

  Model copyWith({String? id, String? name}) {
    return Model(
      id ?? this.id,
      name ?? this.name,
    );
  }

  @override
  String toString() {
    return "Model($id, $name)";
  }
}

class ModelController extends StateNotifier<Model> {
  ModelController() : super(Model("id", "name"));

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateId(String id) {
    state = state.copyWith(id: id);
  }
}

final modelProvider = StateNotifierProvider((ref) {
  return ModelController();
});

class TestApplication extends StatelessWidget {
  const TestApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build");
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Consumer(builder: (context, ref, child) {
            final controller = ref.read(modelProvider.notifier);
            final model = ref.watch(modelProvider);
            return Center(
              child: Column(
                children: [
                  Text(
                    "$model",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 150,
                    child: MaterialButton(
                      child: Text("Update"),
                      height: 40,
                      color: Colors.white,
                      onPressed: () {
                        var random = Random().nextInt(15000);
                        controller.updateId("$random id");
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
