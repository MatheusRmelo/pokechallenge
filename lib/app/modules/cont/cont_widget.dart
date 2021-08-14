import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/cont/cont_controller.dart';

class ContWidget extends StatefulWidget {
  const ContWidget({Key? key}) : super(key: key);

  @override
  _ContWidgetState createState() => _ContWidgetState();
}

class _ContWidgetState extends State<ContWidget> {
  final controller = Modular.get<ContController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Text("COUNT: ${controller.value}"),
              ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed("two");
                  },
                  child: Text("TEste"))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("TEsTE");
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
