import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:provider/provider.dart';

class SelectMaintainenaceEmpolyee extends StatefulWidget {
  final String? maintain_type;
    final String? category;
    final String? regionId;
      final String? walkway;
  const SelectMaintainenaceEmpolyee({ Key? key, this.maintain_type, this.category, this.walkway, this.regionId }) : super(key: key);

  @override
  _SelectMaintainenaceEmpolyeeState createState() => _SelectMaintainenaceEmpolyeeState();
}

class _SelectMaintainenaceEmpolyeeState extends State<SelectMaintainenaceEmpolyee> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

 WidgetsBinding.instance.addPostFrameCallback((_) {
context.read<MaintenanceController>().getMaintanenanceEmployee(context, widget.regionId);
 });

    
  }


  @override
  Widget build(BuildContext context) {
    var controller=  Provider.of<MaintenanceController>(context);
    return 
     Scaffold(
        appBar:  AppBar(
        elevation: 1,

      
      
        backgroundColor: Colors.white,
        titleSpacing: 0,
        
       
        title:  Text(
          currentLang(context)=="ar"?
          
          
          'اختار فني الصيانة':"Select Maintainance Employee")
      ),
       


body: Builder(builder: (_){

if (controller.maintenanceEmployees!.status==Status.LOADING) {
  return Center(
        child: mProgress(context ,fromPage: true),
  );
} 
else if( controller.maintenanceEmployees!.status==Status.ERROR){
return Center(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(controller.maintenanceEmployees!.message!),
const SizedBox(height: 10,) ,
IconButton(onPressed: (){
  controller.getMaintanenanceEmployee(context, widget.regionId);
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
        ],
  ),
);
}
else {
return Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(
    children: [
          Expanded(
            child: ListView.builder(
                itemCount: controller.maintenanceEmployees!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                var emp = controller.maintenanceEmployees!.data![index];
              
              return  Stack(
                children: [
              
              Container(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  onTap: (){
                          controller.setEmployee(emp);
                  },
                  title: Text(emp.name!.toString()),
                  subtitle: Text(emp.email!.toString()),


                  trailing: 
                  
                    controller.maintainModel!=null?
              Visibility(
                
                visible: emp.id==controller.maintainModel!.id,
                child:  Icon(Icons.check_circle ,color:
                
                 Theme.of(context).primaryColor,size: 24,))
              :const SizedBox.shrink()
                  ,
                ),
              ),
             
              
                ],
              );
                }),
          ),
  
  
  
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   //     content: Text(
                        //   //         'Hello ${_nameController.text}\nYour details have been submitted and an email sent to ${_emailController.text}.')));
                        // } else {
                          //The form has some validation errors.
                          //Do Something...
if (controller.maintainModel!=null) {
  
  controller.addOrder(context,
  widget.maintain_type,widget.category,widget.walkway
  
  );
}


                        // }
                      },
                      child:
                      
                      controller.newOrder!.status==Status.LOADING?
                      const CircularProgressIndicator():
                      
                       const Text('Send'))
              
    ],
  ),
);     

}





}),













    );
  }
}