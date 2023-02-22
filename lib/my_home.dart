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
  int numeroPregunta = 0;
  List<String> preguntas = [
    'Los glóbulos rojos viven 4 meses?',
    'El cuerpo humano adulto tiene 306 huesos?',
    'La cobalamina es una vitamina?',
    'Hay 219 episodios de friends?'
  ];
  List<bool> respuestas = [true, false, true, false];
  void verificarRespuestas(bool value) {
    if (numeroPregunta == preguntas.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Game Over"),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    numeroPregunta = 0;
                    puntacion.clear();
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  "Reiniciar",
                  style: TextStyle(fontSize: 13),
                ))
          ],
        ),
      );
    }
    if (respuestas[numeroPregunta] == value) {
      puntacion.add(const Icon(Icons.check, color: Colors.green, size: 40));
    } else {
      puntacion.add(const Icon(
        Icons.close,
        color: Colors.red,
        size: 40,
      ));
    }
    if (numeroPregunta < preguntas.length - 1) {
      numeroPregunta++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
              child: _MyButton(
                funcion: () {
                  verificarRespuestas(true);
                },
                text: "Verdadero",
              ),
            ),
            Expanded(
              child: _MyButton(
                funcion: () {
                  verificarRespuestas(false);
                },
                text: "Falso",
              ),
            ),
            Expanded(
                child: Row(
              children: puntacion,
            ))
          ],
        ),
      ),
    );
  }
}

class _MyButton extends StatelessWidget {
  final String text;
  final Function funcion;
  const _MyButton({
    Key? key,
    required this.text,
    required this.funcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(23)),
        child: TextButton(
            onPressed: () {
              funcion();
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black54, fontSize: 20),
                ))));
  }
}
