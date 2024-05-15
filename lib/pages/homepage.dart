import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_35/utils/extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();
  int percent = 0;
  int month = 0;

  @override
  Widget build(BuildContext context) {
    double widthgdt = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "Lesson 35",
          style: TextStyle(
            color: Colors.amber.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1000),
                lastDate: DateTime(2025),
              );
              if (newDate != null) {
                date = newDate;
                setState(() {});
              }
            },
            child: Text(
              date.format(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    date = DateTime(date.year, date.month - 1);
                    setState(() {});
                  },
                  style: IconButton.styleFrom(
                      foregroundColor: Colors.grey,
                      side: const BorderSide(color: Colors.grey)),
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 40,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "4,950,000",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 0.7,
                      ),
                    ),
                    Text(
                      "so'm",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    date = DateTime(date.year, date.month + 1);
                    setState(() {});
                  },
                  style: IconButton.styleFrom(
                      foregroundColor: Colors.grey,
                      side: const BorderSide(color: Colors.grey)),
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Gap(30),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Oylik byudjet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );

                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                    const Text(
                      '100000000 so`m',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Spacer(),
                    Text('%$percent'),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 5,
                  color: Colors.grey,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: widthgdt * (percent / 100),
                    height: 5,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
