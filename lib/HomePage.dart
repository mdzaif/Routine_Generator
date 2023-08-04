import 'package:flutter/material.dart';
import 'generate.dart';

// After Sign in operation
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//some useful variables.
int numBatches = 0;
int numtime = 0;
int numroom = 0;
List<String> batchNames = [];
List<int> numCourses = [];
List<List<String>> courseNames = [];
List<String> numRooms = [];
List<String> numTime = [];

class _HomePageState extends State<HomePage> {
  // function for numRooms list
  void setNumRoom(int value) {
    setState(() {
      numroom = value;
      numRooms = List.generate(numroom, (index) => '');
    });
  }

  // function for numTime list.
  void setNumTime(int value) {
    setState(() {
      numtime = value;
      numTime = List.generate(numtime, (index) => '');
    });
  }

  void setNumBatches(int value) {
    setState(() {
      numBatches = value;
      batchNames = List.generate(numBatches, (index) => '');
      numCourses = List.generate(numBatches, (index) => 0);
      courseNames = List.generate(numBatches, (index) => []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Batch input
              const Text('Enter the number of batches:'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setNumBatches(int.parse(value));
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              for (int i = 0; i < numBatches; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text('Batch ${i + 1} Name:'),
                                const SizedBox(height: 10),
                                TextFormField(
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    batchNames[i] = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: [
                                Text('Course Count for Batch ${i + 1}:'),
                                const SizedBox(height: 10),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    setState(() {
                                      numCourses[i] = int.parse(value);
                                      courseNames[i] = List.generate(
                                          numCourses[i], (index) => '');
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (numCourses[i] > 0)
                        Column(
                          children: List.generate(numCourses[i], (index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                style: const TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Course ${index + 1}',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    courseNames[i][index] = value;
                                  });
                                },
                              ),
                            );
                          }),
                        ),
                    ],
                  ),
                ),
              ],
              // Room numbers and room names input
              const SizedBox(height: 20),
              const Text('Enter the number of rooms:'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                      onChanged: (value1) {
                        if (value1.isNotEmpty) {
                          setNumRoom(int.parse(value1));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < numroom; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            //Text('Room No ${i + 1}:'),
                            const SizedBox(height: 20),
                            TextFormField(
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: 'Room ${i + 1}',
                              ),
                              onChanged: (value) {
                                numRooms[i] = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              //Time slot input
              const SizedBox(height: 10),
              const Text('Enter the number of time slots:'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                      onChanged: (value2) {
                        if (value2.isNotEmpty) {
                          setNumTime(int.parse(value2));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < numtime; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            //Text('Time Slot ${i + 1}:'),
                            const SizedBox(height: 20),
                            TextFormField(
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: 'Time Slot ${i + 1}',
                              ),
                              onChanged: (value) {
                                numTime[i] = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              // Operation for preview button
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Batch ${i + 1}: ${batchNames[i]}'),
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
                                              (index) =>
                                                  Text('${numRooms[index]} '),
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
                                              (index) =>
                                                  Text('${numTime[index]} '),
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
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Generate()),
                        );
                      },
                      child: const Text('Generate')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
