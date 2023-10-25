import 'package:flutter/widgets.dart';
import 'package:goodfoods/core/presentation/widgets/car_widget.dart';

class CarList extends StatelessWidget {
  const CarList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarWidget(
          bodyNumber: '4343',
          boardNumber: '4545',
          buyDate: '12/12/2023',
          fileLink: 'as.com',
          carType: 'Toyota',

        ) , 
 CarWidget(
          bodyNumber: '4343',
          boardNumber: '4545',
          buyDate: '12/12/2023',
          fileLink: 'as.com',
          carType: 'Toyota',

        ) , 


      ],
    );
  }
}