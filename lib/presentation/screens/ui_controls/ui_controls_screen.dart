import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportation { car, bike, boat, bus, train }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales para desarrolladores'),
          value: isDeveloperMode,
          onChanged: (value) =>
              setState(() => isDeveloperMode = !isDeveloperMode),
        ),
        ExpansionTile(
          title: const Text('Vehiculos de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Vehículo de 4 ruedas'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Vehículo de 2 ruedas'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.bike),
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Vehículo de 0 ruedas'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.boat),
            ),
            RadioListTile(
              title: const Text('Bus'),
              subtitle: const Text('Vehículo de 6 ruedas'),
              value: Transportation.bus,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.bus),
            ),
            RadioListTile(
              title: const Text('Train'),
              subtitle: const Text('Vehículo de 8 ruedas'),
              value: Transportation.train,
              groupValue: selectedTransportation,
              onChanged: (value) =>
                  setState(() => selectedTransportation = Transportation.train),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Wants Breakfast'),
          subtitle: const Text('Desayuno'),
          value: wantsBreakfast,
          onChanged: (value) =>
              setState(() => wantsBreakfast = !wantsBreakfast),
        ),
        CheckboxListTile(
          title: const Text('Wants Lunch'),
          subtitle: const Text('Almuerzo'),
          value: wantsLunch,
          onChanged: (value) => setState(() => wantsLunch = !wantsLunch),
        ),
        CheckboxListTile(
          title: const Text('Wants Dinner'),
          subtitle: const Text('Cena'),
          value: wantsDinner,
          onChanged: (value) => setState(() => wantsDinner = !wantsDinner),
        ),
      ],
    );
  }
}
