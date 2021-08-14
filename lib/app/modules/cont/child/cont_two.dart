import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/cont/cont_controller.dart';

class ContTwoPage extends StatefulWidget {
  const ContTwoPage({Key? key}) : super(key: key);

  @override
  _ContTwoPageState createState() => _ContTwoPageState();
}

class _ContTwoPageState extends State<ContTwoPage> {
  final controller = Modular.get<ContController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text("COUNT: ${controller.value}"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print("TEsTE");
                controller.decrement();
              },
              child: Icon(
                Icons.remove,
              ),
            ));
      },
    );
  }
}
