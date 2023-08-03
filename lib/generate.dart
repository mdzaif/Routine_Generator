import 'package:flutter/material.dart';
import 'HomePage.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  _Generate createState() => _Generate();
}

class _Generate extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Routine Generator'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Batches:'),
                          for (int i = 0; i < numBatches; i++) ...[
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Batch ${i + 1}: ${batchNames[i]}'),
                                  const SizedBox(height: 4),
                                  if (numCourses[i] > 0) ...[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        numCourses[i],
                                        (index) => Text(
                                            'Course ${index + 1}: ${courseNames[i][index]}'),
                                      ),
                                    ),
                                  ],
                                  Text('Rooms: '),
                                  const SizedBox(height: 4),
                                  if (numRooms[i] != Null) ...[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        numroom,
                                        (index) => Text('${numRooms[index]} '),
                                      ),
                                    ),
                                  ],
                                  Text('Time slots: '),
                                  const SizedBox(height: 4),
                                  if (numRooms[i] != Null) ...[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        numtime,
                                        (index) => Text('${numTime[index]} '),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Preview'),
            ),
          ],
        ),
      ),
    );
  }
}
