import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),

      body: _UiCOntrolsView(),
    );
  }
}

class _UiCOntrolsView extends StatefulWidget {
  const _UiCOntrolsView();

  @override
  State<_UiCOntrolsView> createState() => _UiCOntrolsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiCOntrolsViewState extends State<_UiCOntrolsView> {
  bool isDeveloper = true;

  Transportation selectedTransportation = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  void changeValueSwitch() {
    setState(() {
      isDeveloper = !isDeveloper;
    });
  }

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return ListView(
      physics: const ClampingScrollPhysics(), //Para que no rebote
      children: [
        SwitchListTile(
          //Activado o desactivado
          title: const Text('Developer Mode'),
          subtitle: const Text('Marcardor switch'),
          value: isDeveloper,
          onChanged: (value) => changeValueSwitch(),
        ),

        RadioListTile(
          title: const Text('By Car'),
          subtitle: const Text('Viajar en coche'),
          value: Transportation.car, //valor inicial
          groupValue: selectedTransportation, //variable de opcion selectionada
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation
                .car; //para cambiar el valor de selectedTransportation
          }),
        ),

        RadioListTile(
          title: const Text('By Boat'),
          subtitle: const Text('Viajar en barco'),
          value: Transportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.boat;
          }),
        ),

        RadioListTile(
          title: const Text('By Plane'),
          subtitle: const Text('Viajar en avión'),
          value: Transportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.plane;
          }),
        ),

        RadioListTile(
          title: const Text('By Submarine'),
          subtitle: const Text('Viajar en submarino'),
          value: Transportation.submarine,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.submarine;
          }),
        ),

        ExpansionTile(
          title:  Text('Vehiculo de transporte', style: TextStyle(color: color.primary),),
          subtitle: Text('Selecciona solo un transporte', style: TextStyle(color: color.secondary),),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar en coche'),
              value: Transportation.car, //valor inicial
              groupValue:
                  selectedTransportation, //variable de opcion selectionada
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation
                    .car; //para cambiar el valor de selectedTransportation
              }),
            ),

            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),

            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar en avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),

            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desea Desayunar?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),

        CheckboxListTile(
          title: const Text('¿Desea Almuerzar?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        CheckboxListTile(
          title: const Text('¿Desea Cenar?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),

        
      ],
    );
    
    
  }
}
