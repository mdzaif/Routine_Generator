import 'package:flutter/material.dart';
import 'HomePage.dart';

int x = 0;
int y = 0;
List<int> course_counter = [];
List<String> generate() {
  //Working on algorithm from here
  for (int i = 0; i < numBatches; i++) {
    course_counter.add(0);
  }

  List<String> generatedOutput = [];
  generatedOutput.add(" ");
  //Implmenting loops
  int batch_counter;
  for (int i = 0; i < 5; i++) {
    if (i == 0)
      generatedOutput.add("\nSunday");
    else if (i == 1)
      generatedOutput.add("\nMonday");
    else if (i == 2)
      generatedOutput.add("\nTuesday");
    else if (i == 3)
      generatedOutput.add("\nWednesday");
    else if (i == 4) generatedOutput.add("\nThursday");

    for (int j = 0; j < numtime; j++) {
      generatedOutput.add("${numTime[j]}:");
      batch_counter = 0;
      for (int k = 0; k < numtime; k++) {
        y = course_counter[x];
        generatedOutput.add(
            "Room ${numRooms[k]} : ${batchNames[x]} -- ${courseNames[x][y]}");
        if (course_counter[x] < numCourses[x] - 1)
          course_counter[x]++;
        else
          course_counter[x] = 0;

        if (x < numBatches - 1)
          x++;
        else
          x = 0;

        if (batch_counter < numBatches - 1)
          batch_counter++;
        else
          break;
      }
    }
  }

  return generatedOutput;
}

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  _Generate createState() => _Generate();
}

class _Generate extends State<Generate> {
  List<String> generatedData = [];

  @override
  void initState() {
    super.initState();
    // Call the generate function to get the generated data
    generatedData = generate();
  }

  @override
  Widget build(BuildContext context) {
    //generate();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routine Generator',
      theme: ThemeData(
        brightness: Brightness.dark, // Enable dark mode
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.white,
            ),
            title: Text('Routine Generator'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String dataLine in generatedData) Text(dataLine),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
