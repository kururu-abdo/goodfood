import 'package:flutter/widgets.dart';
import 'package:goodfoods/core/presentation/widgets/machine_widget.dart';

class MachineList extends StatelessWidget {
  const MachineList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MachineWidget(
          machineName: 'Machine name',
          branch: 'Qasim',
          buyDate: '12/12/2023',
          machineCode: '4454',
          lastMaintenanceDate:'12/12/2023' ,
          numOfMaintenances: 10,

        ) , 
 MachineWidget(
          machineName: 'Machine name',
          branch: 'Qasim',
          buyDate: '12/12/2023',
          machineCode: '4454',
          lastMaintenanceDate:'12/12/2023' ,
          numOfMaintenances: 10,

        ) , 

      ],
    );
  }
}