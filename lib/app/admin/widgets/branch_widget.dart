import 'package:flutter/material.dart';

class BranchWidget extends StatelessWidget {
  final String? branceName;
  final String? address;
  const BranchWidget({ Key? key, this.branceName, this.address }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     
          Container(
            // elevation: 3,

            decoration: const BoxDecoration(
                  color: Colors.white,
    
      //      gradient: const LinearGradient(
      //   stops:  [0.05, 0.02],
      //   colors: [Colors.red, Colors.white]
      // ),
      //      borderRadius: const BorderRadius.all(
      // Radius.circular(10),
      // ),
      boxShadow: [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 0.0),
      )
      ],
    
            ),
            margin: const EdgeInsets.only(
              bottom: 8
            ),
            child:  ListTile(
              title: Text(branceName!),
              subtitle: Text(address!),

            ),

          ) 

;
  }
}