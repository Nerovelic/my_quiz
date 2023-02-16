import 'package:flutter/material.dart';

// ignore: camel_case_types
class My_Home extends StatelessWidget {
  const My_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> puntacion = [];
  List<String> preguntas = [
    'Los glóbulos rojos viven 4 meses',
    'El cuerpo humano adulto tiene 306 huesos',
    'La cobalamina es una vitamina'
  ];
  int numeroPregunta = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                preguntas[numeroPregunta],
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              )),
            )),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        puntacion.add(const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 40,
                        ));
                        if (numeroPregunta < preguntas.length - 1) {
                          numeroPregunta++;
                        }
                      });
                    },
                    child: const Text(
                      "Verdadero",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ))),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          puntacion.add(const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 40,
                          ));
                          if (numeroPregunta < preguntas.length - 1) {
                            numeroPregunta++;
                          }
                        });
                      },
                      child: const Text(
                        "Falso",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )))),
        ),
        Row(
          children: puntacion,
        )
      ],
    );
  }
}
