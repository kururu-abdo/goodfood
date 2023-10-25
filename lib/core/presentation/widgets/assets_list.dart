import 'package:flutter/widgets.dart';
import 'package:goodfoods/core/presentation/widgets/other_asset_widget.dart';

class AssetsList extends StatelessWidget {
  const AssetsList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        OtherAssetWidget(
          assetName: 'Asset name',
          branch: 'Qasim',
          buyDate: '12/12/2023',
          fileLink: 'a.com',
         

        ) , 
OtherAssetWidget(
          assetName: 'Asset name',
          branch: 'Qasim',
          buyDate: '12/12/2023',
          fileLink: 'a.com',
         

        ) ,

      ],
    );
  }
}