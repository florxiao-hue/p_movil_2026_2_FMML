import 'package:flutter/material.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Perfil Académico',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PerfilHome(nombreCompleto: 'FLOR DE MARIA MAMANI LAURA'),
    );
  }
}

class PerfilHome extends StatefulWidget {
  final String nombreCompleto;
  const PerfilHome({super.key, required this.nombreCompleto});

  @override
  State<PerfilHome> createState() => _PerfilHomeState();
}

class _PerfilHomeState extends State<PerfilHome> {

  String nombreEstudiante = 'FLOR DE MARIA MAMANI LAURA'; 
  int numeroPersonal = 60;
  double promedioPonderado = 16.8;
  bool estaMatriculado = true;

  late int logrosAcademicos;

  @override
  void initState() {
    super.initState();
    logrosAcademicos = numeroPersonal; 
  }

  void _incrementarLogro() {
    setState(() {
      logrosAcademicos++;
    });
  }

  @override
  Widget build(BuildContext context) {

    String parImpar = (numeroPersonal % 2 == 0) 
        ? "Tu número personal es par" 
        : "Tu número personal es impar";
    
    String altoBajo = (numeroPersonal > 50) 
        ? "Número personal alto" 
        : "Número personal bajo";

    List<String> multiplosList = [];
    for (int i = 1; i <= 5; i++) {
      int resultado = numeroPersonal * i;
      multiplosList.add('$numeroPersonal x $i = $resultado');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombreCompleto), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Perfil Académico Interactivo',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: Colors.indigo, // Título principal en color índigo
              ),
            ),
            const SizedBox(height: 10),
            
            // Cada fila con un color diferente en las letras:
            Text(
              'Nombre: $nombreEstudiante', 
              style: const TextStyle(fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.w500)
            ),
            Text(
              'Número Personal (NP): $numeroPersonal', 
              style: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500)
            ),
            Text(
              'Promedio Ponderado: $promedioPonderado', 
              style: const TextStyle(fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.w500)
            ),
            Text(
              '¿Matriculado?: ${estaMatriculado ? "Sí" : "No"}', 
              style: const TextStyle(fontSize: 16, color: Colors.purple, fontWeight: FontWeight.w500)
            ),
            const Divider(height: 30),

            const Text(
              'Clasificación del NP:', 
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown)
            ),
            Text('• $parImpar', style: const TextStyle(color: Colors.blueGrey)),
            Text('• $altoBajo', style: const TextStyle(color: Colors.blueGrey)),
            const Divider(height: 30),
           
            const Text(
              'Primeros 5 múltiplos de tu NP (Generados con for):', 
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)
            ),
            const SizedBox(height: 5),
           ...multiplosList.map((m) => Text(m, style: const TextStyle(color: Colors.cyan))).toList(),
            const Divider(height: 30),

            Center(
              child: Column(
                children: [
                  Text(
                    'Logros Académicos: $logrosAcademicos',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _incrementarLogro,
                    icon: const Icon(Icons.add),
                    label: const Text('Sumar logro'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}