import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/data/models/chat_selection_model.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';


class SelectEmployee extends StatefulWidget {
  final Function(Emp)? onSelect;
  const SelectEmployee({ Key? key, this.onSelect }) : super(key: key);

  @override
  _SelectEmployeeState createState() => _SelectEmployeeState();
}

class _SelectEmployeeState extends State<SelectEmployee> {
  bool showSnackBar = false;
   TreeViewController? _controller;
   bool expandChildrenOnReady = true;

@override
void initState() { 
  super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatController>().getChatSelectionModel();
   });
}

// List options =['Departments' , 'Branches'];



   var data   = [
     {
       "area":"القصيم" , 
       "branches":[
         {
           "name":"البخاري" ,
           "employees":[
             {
               "name":"السماني" ,
               "job":"مدير مالي"
             } ,
             {
               "name":"حسام" ,
               "job":"مدير "
             }
           ]
         } ,
         {
           "name":"حي النفل" ,
           "employees":[
             {
               "name":"محمد" ,
               "job":"مدير مالي"
             } ,
             {
               "name":"حسام" ,
               "job":"مدير "
             }
           ]
         }
       ]
     },


 {
       "area":"الرياض" , 
       "branches":[
         {
           "name":"المشتل" ,
           "employees":[
             {
               "name":"السماني" ,
               "job":"مدير تسويق"
             } ,
             {
               "name":"حسام" ,
               "job":"مدير "
             }
           ]
         } ,
         {
           "name":"حي النفل" ,
           "employees":[
             {
               "name":"محمد" ,
               "job":"مدير مالي"
             } ,
             {
               "name":"حسام" ,
               "job":"مدير "
             }
           ]
         }
       ]
     },

   
 {
       "area":"جدة" , 
       "branches":[
         
         {
           "name":"حي النفل" ,
           "employees":[
             {
               "name":"محمد" ,
               "job":"مدير مالي"
             } ,
             {
               "name":"حسام" ,
               "job":"مدير "
             }
           ]
         }
       ]
     },
   ]; 
    int selected = -1; //attention
   int selectedBranch = -1; //attention
      int selectedEmp = -1; //attention
         int selectedCity = -1; //attention
int selectedDept=-1;
int selectedOptions=-1;

  @override
  Widget build(BuildContext context) {
    List options2 =[{
  "title":
  currentLang(context)=="ar"?"الاقسامح":
  'Departments' ,  "key":"departments"   } ,{
  "title":
   currentLang(context)=="ar"?"الفروع":
  'Branches' ,  "key":"branchs"   }];
      var appLocale = AppLocalizations.of(context);
      var provider = Provider.of<ChatController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
   backgroundColor: Colors.white,
          titleSpacing: 0,
        title:  Text(appLocale!.translate("select_emp")!),
      ),
      body:  
      
      
      Builder(
        builder: (context) {
          if (provider.isLaoding) {
            return Center(
              child: mProgress(context ,
              fromPage: true
              ),
            );
          }
 if (provider.isError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
Text(provider.error.toString()) , 
const SizedBox(height: 10,),
IconButton(onPressed: (){
provider.getChatSelectionModel();
}, icon: const Icon(Icons.refresh ,color: kcPrimaryColor,))



                ],
              )
            );
          }


          return Container(
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
          blurRadius: 6.0,
          spreadRadius: 2.0,
          offset: Offset(0.0, 0.0),
          )
          ],
          ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                ListView.builder(
                  key: Key('builder ${selected.toString()}'), //attention
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.chatSelectionModel!.data!.regions!.length,
                  itemBuilder: (context, index) {
                    var area=  provider.chatSelectionModel!.data!.regions![index];
                    return Column(children: <Widget>[
                      const Divider(
                        height: 17.0,
                        color: Colors.white,
                      ),
                      ExpansionTile(
                        key: Key(index.toString()), //attention
                        initiallyExpanded: index == selected, //attention

                        leading: const Icon(
                          Icons.person,
                          size: 50.0,
                          color: Colors.black,
                        ),
                        title: Text(
                          
                          appLocale.locale.languageCode=="ar"?
                           area.nameAr.toString():
                          area.nameEn.toString(),
                            style: const TextStyle(
                                color: Color(0xFF09216B),
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        subtitle:  Text(
  appLocale.locale.languageCode=="ar"?

                       "${ area.cities!.length}    مدينة"
                       
                       :   "${area.cities!.length}  cities"
                       
                       
                       ,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onExpansionChanged: ((newState) {
                          if (newState) {
                            setState(() {
                              const Duration(seconds: 20000);
                              selected = index;
                              selectedCity=-1;
                            });
                          } else {
                            setState(() {
                              selected = -1;
                            });
                          }
                        }),
                       
                        children:
        
              area.cities!
                        .asMap()
                        
                        .map(
                          (cityIndex, city)

                           =>
                          MapEntry(cityIndex, 

  Container(
    padding: const EdgeInsets.symmetric(horizontal: 15 ),
    decoration: const BoxDecoration(
          color: scaffoldLightColor
    ),
    child: ExpansionTile(
      
                          key: Key("city $selectedCity"), //attention
                          initiallyExpanded: cityIndex == selectedCity, //attention
  
                          leading: const Icon(
                            Icons.person,
                            size: 50.0,
                            color: Colors.black,
                          ),
                          title: Text(
                            
                            
                            appLocale.locale.languageCode=="ar"?
city.nameAr.toString():city.nameEn.toString()
                            ,
                              style: const TextStyle(
                                  color: Color(0xFF09216B),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold)),
                          subtitle:  Text(
                            appLocale.locale.languageCode=="ar"?

                            "${city.branchs!.length}    فرع     ${city.departments!.length}    قسم" 
                            :
                            "${city.branchs!.length}    branches      ${city.departments!.length}    departments"

                          // (branch['employees'] as List ).length.toString()
                          ,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onExpansionChanged: ((newState) {
                            if (newState) {
                              setState(() {
                                const Duration(seconds: 20000);
                                selectedCity = cityIndex;
                                selectedOptions=-1;
                              });
                            } else {
                              setState(() {
                                selectedCity = -1;
                              });
                            }
                          }) ,


                   


                     children: 
                    options2.asMap().map((opetionIndex, option) =>   MapEntry(opetionIndex,
                      Container(
    padding: const EdgeInsets.symmetric(horizontal: 15 ),
    decoration: const BoxDecoration(
          color: scaffoldLightColor
    ),
    child: ExpansionTile(
                          key: Key("option $selectedBranch"), //attention
                          initiallyExpanded: opetionIndex == selectedOptions, //attention
  
                          leading: const Icon(
                            Icons.person,
                            size: 50.0,
                            color: Colors.black,
                          ),
                          title: Text(
                            
                            
//                             appLocale.locale.languageCode=="ar"?
// branch.nameAr.toString():branch.nameEn.toString()
option['title']
                            ,
                              style: const TextStyle(
                                  color: Color(0xFF09216B),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold)),
                          subtitle:  const Text(
                            ""
                            // appLocale.locale.languageCode=="ar"?

                            // "${branch.emp!.length}    موظف"
                            // :
                            // "${branch.emp!.length}    Employees"

                          // (branch['employees'] as List ).length.toString()
                          ,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onExpansionChanged: ((newState) {
                            if (newState) {
                              setState(() {
                                const Duration(seconds: 20000);
                                selectedOptions = opetionIndex;
                                selectedDept=-1;
                                selectedBranch=-1;
                              });
                            } else {
                              setState(() {
                                selectedOptions = -1;
                              });
                            }
                          }),


children: 

opetionIndex==1?



//  city.branchs!

// :






                     city.branchs!
                        .asMap()
                        
                        .map(
                          (branchIndex, branch) =>
                          MapEntry(branchIndex, 

  Container(
    padding: const EdgeInsets.symmetric(horizontal: 15 ),
    decoration: const BoxDecoration(
          color: scaffoldLightColor
    ),
    child: ExpansionTile(
                          key: Key("branch $selectedBranch"), //attention
                          initiallyExpanded: branchIndex == selectedBranch, //attention
  
                          leading: const Icon(
                            Icons.person,
                            size: 50.0,
                            color: Colors.black,
                          ),
                          title: Text(
                            
                            
                            appLocale.locale.languageCode=="ar"?
branch.nameAr.toString():branch.nameEn.toString()
                            ,
                              style: const TextStyle(
                                  color: Color(0xFF09216B),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold)),
                          subtitle:  Text(
                            appLocale.locale.languageCode=="ar"?

                            "${branch.emp!.length}    موظف"
                            :
                            "${branch.emp!.length}    Employees"

                          // (branch['employees'] as List ).length.toString()
                          ,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onExpansionChanged: ((newState) {
                            if (newState) {
                              setState(() {
                                const Duration(seconds: 20000);
                                selectedBranch = branchIndex;
                              });
                            } else {
                              setState(() {
                                selectedBranch = -1;
                              });
                            }
                          }),
children:  branch.emp!.map((emp){
  
                          return 
                          
                          Card(
                            child: ListTile(
                              onTap: (){
widget.onSelect!(emp);
Navigator.pop(context);
                              },
                              title: Text(
                              emp.name!.toString()),

                                subtitle:Text(emp.email!.toString()) ,
                            ),
                          );
                          
                          
                          
                        }).toList()


    ))
)).values.toList()          
                        
                      :  


                      

                     city.departments!
                        .asMap()
                        
                        .map(
                          (deptIndex, dept) =>
                          MapEntry(deptIndex, 

  Container(
    padding: const EdgeInsets.symmetric(horizontal: 15 ),
    decoration: const BoxDecoration(
          color: scaffoldLightColor
    ),
    child: ExpansionTile(
                          key: Key("dept $selectedDept"), //attention
                          initiallyExpanded: deptIndex == selectedDept, //attention
  
                          leading: const Icon(
                            Icons.person,
                            size: 50.0,
                            color: Colors.black,
                          ),
                          title: Text(
                            
                            
                            appLocale.locale.languageCode=="ar"?
dept.nameAr.toString():dept.nameEn.toString()
                            ,
                              style: const TextStyle(
                                  color: Color(0xFF09216B),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold)),
                          subtitle:  Text(
                            appLocale.locale.languageCode=="ar"?

                            "${dept.emp!.length}    موظف"
                            :
                            "${dept.emp!.length}    Employees"

                          // (branch['employees'] as List ).length.toString()
                          ,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onExpansionChanged: ((newState) {
                            if (newState) {
                              setState(() {
                                const Duration(seconds: 20000);
                                selectedDept = deptIndex;
                              });
                            } else {
                              setState(() {
                                selectedDept = -1;
                              });
                            }
                          }),
children:  dept.emp!.map((emp){
  
                          return 
                          
                          Card(
                            child: ListTile(
                              onTap: (){
widget.onSelect!(emp);
Navigator.pop(context);
                              },
                              title: Text(
                              emp.name!.toString()),

                                subtitle:Text(emp.email!.toString()) ,
                            ),
                          );
                          
                          
                          
                        }).toList()


    ))
)).values.toList()          
                            
                          

                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          )




                          )
                    
                    
                     )
                     
                     
                     ).values.toList()
      

  
    )))
                        ).values
                        
                        .toList()
                        
                      ),
                    ]);
                  },
                )
              ]),
            ));
        }
      )
    );
  }
}
final sampleTree = TreeNode.root()
  ..addAll([
    TreeNode(key: "Areas")..addAll(

      [
        TreeNode(key: "Riyadh")
      ]
    ),
  
  ]);