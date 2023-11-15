import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:provider/provider.dart';

class DepartmentAssetsPage extends StatefulWidget {

  final String? deptId;
  const DepartmentAssetsPage({ Key? key, this.deptId }) : super(key: key);

  @override
  _DepartmentAssetsPageState createState() => _DepartmentAssetsPageState();
}

class _DepartmentAssetsPageState extends State<DepartmentAssetsPage> {
  @override
  void initState() { 
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().getDepartementAssets(context , widget.deptId!);

     });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}