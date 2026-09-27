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
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          DiaSemana(texto: 'Lun'),
                          DiaSemana(texto: 'Mar'),
                          DiaSemana(texto: 'Mié'),
                          DiaSemana(texto: 'Jue'),
                          DiaSemana(texto: 'Vie'),
                          DiaSemana(texto: 'Sáb'),
                          DiaSemana(texto: 'Dom'),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Para formar cada semana utilizo Row, ya que me permite colocar los siete días
                      // de manera horizontal y así mantener la estructura ordenada del calendario.
                      const Row(
                        children: [
                          DiaCalendario(numero: '31', otroMes: true),
                          DiaCalendario(numero: '1'),
                          DiaCalendario(numero: '2'),
                          DiaCalendario(numero: '3'),
                          DiaCalendario(numero: '4'),
                          DiaCalendario(numero: '5'),
                          DiaCalendario(numero: '6'),
                        ],
                      ),
                      const Row(
                        children: [
                          DiaCalendario(numero: '7'),
                          DiaCalendario(numero: '8'),
                          DiaCalendario(numero: '9'),
                          DiaCalendario(numero: '10'),
                          DiaCalendario(numero: '11'),
                          DiaCalendario(numero: '12', seleccionado: true),
                          DiaCalendario(numero: '13'),
                        ],
                      ),
                      const Row(
                        children: [
                          DiaCalendario(numero: '14'),
                          DiaCalendario(numero: '15'),
                          DiaCalendario(numero: '16'),
                          DiaCalendario(numero: '17'),
                          DiaCalendario(numero: '18'),
                          DiaCalendario(numero: '19'),
                          DiaCalendario(numero: '20'),
                        ],
                      ),
                      const Row(
                        children: [
                          DiaCalendario(numero: '21'),
                          DiaCalendario(numero: '22'),
                          DiaCalendario(numero: '23'),
                          DiaCalendario(numero: '24'),
                          DiaCalendario(numero: '25'),
                          DiaCalendario(numero: '26'),
                          DiaCalendario(numero: '27'),
                        ],
                      ),
                      const Row(
                        children: [
                          DiaCalendario(numero: '28'),
                          DiaCalendario(numero: '29'),
                          DiaCalendario(numero: '30'),
                          DiaCalendario(numero: '1', otroMes: true),
                          DiaCalendario(numero: '2', otroMes: true),
                          DiaCalendario(numero: '3', otroMes: true),
                          DiaCalendario(numero: '4', otroMes: true),
                        ],
                      ),
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

class DiaSemana extends StatelessWidget {
  final String texto;

  const DiaSemana({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class DiaCalendario extends StatelessWidget {
  final String numero;
  final bool otroMes;
  final bool seleccionado;

  const DiaCalendario({
    super.key,
    required this.numero,
    this.otroMes = false,
    this.seleccionado = false,
  });

  @override
  Widget build(BuildContext context) {
    // Utilizo Expanded para aprovechar y repartir mejor el espacio disponible,
    // haciendo que los días mantengan una distribución similar dentro de cada fila.
    return Expanded(
      child: Container(
        height: 45,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: seleccionado ? Colors.indigo : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            numero,
            style: TextStyle(
              fontSize: 14,
              fontWeight: seleccionado ? FontWeight.bold : FontWeight.normal,
              color: seleccionado
                  ? Colors.white
                  : otroMes
                  ? Colors.grey
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
