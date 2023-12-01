import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando películas',
      'Comprando palomitas',
      'Acomodando asientos',
      'Preparando la sala',
      'Ya casi estamos listos',
      'Esto se está tardando mucho... ¿no?',
    ];

    return Stream.periodic(
      const Duration(seconds: 1),
      (step) => messages[step],
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere un momento...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();

              return Text(snapshot.data.toString());
            },
          )
        ],
      ),
    );
  }
}
