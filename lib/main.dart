import 'package:flutter/material.dart';

/*
  Para realizar este laboratorio apliqué lo aprendido sobre Flutter, utilizando
  principalmente Row y Column para organizar el calendario. También usé otros
  widgets para darle un mejor diseño y mantener los elementos ordenados.
*/

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarioPage(),
    );
  }
}

// En esta parte uso StatelessWidget porque el calendario que estoy realizando
// es un diseño estático y por el momento no necesito que cambie su información.
class CalendarioPage extends StatelessWidget {
  const CalendarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 430,
            padding: const EdgeInsets.all(20),

            // Utilizo Column para organizar de manera vertical las partes principales de
            // mi diseño, colocando primero el encabezado, luego el calendario y los eventos.
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      Column(
                        children: [
                          Text(
                            'Septiembre 2026',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Mi calendario',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.calendar_month, color: Colors.white, size: 28),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
