import 'package:goodfoods/core/data/models/area_staus_data.dart';
import 'package:goodfoods/core/data/models/branch_model.dart';
import 'package:goodfoods/core/data/models/chat_selection_model.dart';
import 'package:goodfoods/core/data/models/city_model.dart';
import 'package:goodfoods/core/data/models/region_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class CommmomApis {
    final ApiBaseHelper _helper = ApiBaseHelper();



   Future<List<BranchModel>> getBranches(
   ) async {

     List<BranchModel> branches=[];
    final response = await _helper.get("branch/get_branchs" ,
    
    
    );
Iterable I =response['data'];
branches = I.map((e) => BranchModel.fromJson(e)).toList();





    return branches;
  }




   Future<List<BranchModel>> getBranchesByCity(
     String? cityId
   ) async {

     List<BranchModel> branches=[];
    final response = await _helper.get("branch/get_branchs?city_id=$cityId" ,
    
    
    );
Iterable I =response['data'];
branches = I.map((e) => BranchModel.fromJson(e)).toList();





    return branches;
  }



   Future<List<BranchModel>> getBranchesByRegion(
     String? regionId
   ) async {

     List<BranchModel> branches=[];
    final response = await _helper.get("branch/get_branchs?region_id=$regionId" ,
    
    
    );
Iterable I =response['data'];
branches = I.map((e) => BranchModel.fromJson(e)).toList();





    return branches;
  }


   Future<List<BranchModel>> getBranchesByBrand(
     String? brandId
   ) async {

     List<BranchModel> branches=[];
    final response = await _helper.get("branch/get_branchs?brand_id=$brandId" ,
    
    
    );
Iterable I =response['data'];
branches = I.map((e) => BranchModel.fromJson(e)).toList();





    return branches;
  }



   Future<List<CityModel>> getCities(
   ) async {

     List<CityModel> cities=[];
    final response = await _helper.get("places/get_cities" ,
    
    
    );
Iterable I =response['data'];
cities = I.map((e) => CityModel.fromJson(e)).toList();





    return cities;
  }




   Future<List<RegionModel>> getRegions(
   ) async {

     List<RegionModel> regions=[];
    final response = await _helper.get("places/get_regions" ,
    
    
    );
Iterable I =response['data'];
regions = I.map((e) => RegionModel.fromJson(e)).toList();





    return regions;
  }

Future<List<RegionModel>> getBrands(
   ) async {

     List<RegionModel> regions=[];
    final response = await _helper.get("brand/get_brands" ,
    
    
    );
Iterable I =response['data'];
regions = I.map((e) => RegionModel.fromJson(e)).toList();





    return regions;
  }




   Future<List<CityModel>> getCitiesByRegion(
     String? regionId
   ) async {

     List<CityModel> cities=[];
    final response = await _helper.get("places/get_citites_by_region/$regionId" ,
    
    
    );
Iterable I =response['data'];
cities = I.map((e) => CityModel.fromJson(e)).toList();





    return cities;
  }

Future<ChatSelectionModel> getMessageSelection(
   ) async {

ChatSelectionModel? chatSelectionModel;
    final response = await _helper.get("msg/get_data" ,
    
    
    );

chatSelectionModel= ChatSelectionModel.fromJson(response);





    return chatSelectionModel;
  }

Future<List<AreaStatusData>> getAreaStatusData(
   ) async {

     List<AreaStatusData> branches=[];
    final response = await _helper.get(
      
     
      "maintain/get_regions_report" ,
    
    
    );
Iterable I =response['data'];
branches = I.map((e) => AreaStatusData.fromJson(e)).toList();





    return branches;
  }
Future<AreaStatusData> getAreaStatusByBranch(
    int? region,

  int? branch
   ) async {
log("REGION $region  BRANCH $branch");
  late   AreaStatusData branches;
    final response = await _helper.get(
      branch!=null?

     
      "maintain/get_region_status/$region?branch_id=$branch":
      
      "maintain/get_region_status/$region" 
       ,
    
    
    );
var e =response['data'];
branches = AreaStatusData.fromJson(e);





    return branches;
  }


}