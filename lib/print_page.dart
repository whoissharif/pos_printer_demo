import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';

class PrintPage extends StatefulWidget {
  const PrintPage({Key key}) : super(key: key);

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> devices = [];
  String deviceMsg = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initPrinter());
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if(!mounted) return;

    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        devices = val;
      });
      if (devices.isEmpty) {
        setState(() {
          deviceMsg = 'No Devices';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Printer'),
      ),
      body: devices.isEmpty
          ? Center(
              child: Text(deviceMsg ?? ''),
            )
          : ListView.builder(
              itemCount: devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: const Icon(Icons.print),
                  title: Text(devices[i].name),
                  subtitle: Text(devices[i].address),
                  onTap: () {},
                );
              }),
    );
  }
}
