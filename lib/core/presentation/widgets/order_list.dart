import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  final int? status;
  const OrderList({ Key? key, this.status }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  const [

        // OrderWidget(to: const ['Samani' ,'Husam']  , 
        
        // from: 'Abdo',
        // fileLink: 'a.com',
        // orderTitle: 'maintanenace machine x',
        // orderDate: '12-10-2023',
        // status: status!,
        // )
      ],
    );
  }
}