import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'application/helpers/rupiah_formatter.dart';
import 'application/models/invoice.dart';

class Print extends StatefulWidget {
  final Invoice data;

  const Print({super.key, required this.data});

  @override
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  List<BluetoothDevice>? devices;
  BluetoothDevice? selectedDevice;
  final BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();

    printer.getBondedDevices().then((temp) {
      setState(() {
        devices = temp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: devices?.length ?? 0,
              itemBuilder: (context, index) {
                bool isLoading = false;

                return StatefulBuilder(builder: (context, setStateListTile) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          devices![index].name ?? '-',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        trailing: ElevatedButton(
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const Text('Print'),
                          onPressed: () async {
                            if (!isLoading) {
                              setStateListTile(() => isLoading = true);

                              if (!((await printer.isConnected) ?? false)) {
                                await printer.connect(devices![index]);
                              }

                              if ((await printer.isConnected) ?? false) {
                                // size
                                // 0: normal
                                // 1: normal bold
                                // 2: medium - bold
                                // 3: large - bold

                                // align
                                // 0: left
                                // 1: center
                                // 2: right
                                // ignore: avoid_single_cascade_in_expression_statements

                                printer.printNewLine();
                                printer.printNewLine();
                                printer.printCustom('ARGA AZKA', 2, 1);
                                printer.printCustom('Laundry', 1, 1);
                                printer.printCustom(
                                    '================================', 0, 1);
                                printer.printCustom(
                                    'Cabang       : ${widget.data.branchKasir ?? ''}',
                                    0,
                                    0);
                                printer.printCustom(
                                    'Kasir        : ${widget.data.kasir?.split(' - ')[0] ?? ''}',
                                    0,
                                    0);
                                printer.printCustom(
                                    'Phone        :  ${widget.data.kasir?.split(' - ')[1] ?? ''}',
                                    0,
                                    0);
                                printer.printCustom(
                                    '--------------------------------', 0, 1);
                                printer.printCustom(
                                    DateFormat('dd/MM/yyyy - HH:MM:ss', 'id_ID')
                                        .format(
                                      (DateTime.parse(
                                          '${widget.data.createdAt}')),
                                    ),
                                    0,
                                    2);
                                printer.printCustom(
                                    widget.data.customerName ?? '', 0, 0);
                                printer.printLeftRight(
                                    widget.data.phoneNumber
                                            ?.replaceAll('+62', '0') ??
                                        '',
                                    'No. ${widget.data.id ?? ''}',
                                    0);
                                printer.printCustom(
                                    '--------------------------------', 0, 1);
                                printer.printCustom(
                                    (widget.data.packageName ?? ''), 0, 0);
                                printer.printCustom(
                                    '${widget.data.weight ?? ''} x ${rupiah(widget.data.price ?? '')}',
                                    0,
                                    0);
                                printer.printCustom(
                                    '--------------------------------', 0, 1);
                                printer.printLeftRight('Total        :',
                                    rupiah(widget.data.totalPrice ?? ''), 0);
                                printer.printLeftRight('Kurang Bayar :',
                                    rupiah(widget.data.pendingPaid ?? ''), 0);
                                printer.printLeftRight('Bayar        :',
                                    rupiah(widget.data.paidOff ?? ''), 0);
                                printer.printCustom(
                                    '--------------------------------', 0, 1);
                                printer.printCustom(
                                    widget.data.status ?? '', 2, 1);
                                printer.printCustom(
                                    '--------------------------------', 0, 1);
                                printer.printCustom('Terimakasih', 1, 1);
                                if (widget.data.branchKasir ==
                                    'jembatan besi') {
                                  printer.printCustom(
                                      'Jl. Jembatan Besi II, RT. 07/01,', 0, 1);
                                  printer.printCustom(
                                      'No.3, Tambora Jakarta Barat', 0, 1);
                                }
                                if (widget.data.branchKasir == 'kali anyar') {
                                  printer.printCustom(
                                      'Jl. Kali Anyar, RT. 00/00,', 0, 1);
                                  printer.printCustom(
                                      'No. 00, Kali Anyar Jakarta Barat', 0, 1);
                                }
                                if (widget.data.branchKasir == 'sawah besar') {
                                  printer.printCustom(
                                      'Jl. Sawah Besar, RT. 00/00,', 0, 1);
                                  printer.printCustom(
                                      'No. 00, Sabes Jakarta Pusat', 0, 1);
                                }
                                printer.printCustom('0895330088933', 0, 1);
                                printer.printNewLine();
                                printer.printNewLine();
                                printer.paperCut();

                                setStateListTile(() => isLoading = false);

                                if ((await printer.isConnected) ?? false) {
                                  printer.disconnect();
                                }
                              }
                            }
                          },
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
