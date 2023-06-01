// ignore_for_file: camel_case_types

import 'package:counter_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const <Widget>[
        // Obx(() => Text(controller.counterList.toString())),
        CounterPage_Title(),
        SizedBox(height: 10),
        CounterPage_Counter(),
        Divider(
          height: 32,
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }
}

class CounterPage_Title extends StatelessWidget {
  const CounterPage_Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey.shade800,
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.edit_rounded,
            size: 16,
            color: Colors.grey,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: TextField(
              controller: Get.put(CounterController()).titleController,
              decoration: const InputDecoration.collapsed(hintText: "Title"),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterPage_Counter extends StatelessWidget {
  const CounterPage_Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: InkWell(
              onTap: () => controller.decreaseCounter(),
              child: Ink(
                padding: const EdgeInsets.all(10),
                color: Colors.grey.shade800,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "-",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Total Count"),
                Obx(() {
                  return Text(
                    controller.counter.value.toString(),
                    style: const TextStyle(fontSize: 32),
                  );
                }),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey.shade800,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.edit_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: TextField(
                          controller: controller.addController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "default ${controller.add}",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: InkWell(
              onTap: () => controller.increaseCounter(),
              child: Ink(
                padding: const EdgeInsets.all(10),
                color: Colors.grey.shade800,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
