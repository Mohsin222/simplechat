import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:photo_manager/photo_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

// final FilterOptionGroup _filterOptionGroup = FilterOptionGroup(
//     imageOption: const FilterOption(
//       sizeConstraint: SizeConstraint(ignoreSize: true),
//     ),
//   );
//   final int _sizePerPage = 50;

//   AssetPathEntity? _path;
//   List<AssetEntity>? _entities;
//   int _totalEntitiesCount = 0;

//   int _page = 0;
//   bool _isLoading = false;
//   bool _isLoadingMore = false;
//   bool _hasMoreToLoad = true;

// Future<void> _requestAssets() async {
//     setState(() {
//       _isLoading = true;
//     });
//     // Request permissions.
//     final PermissionState ps = await PhotoManager.requestPermissionExtend();
//     if (!mounted) {
//       return;
//     }
//     // Further requests can be only proceed with authorized or limited.
//     if (!ps.hasAccess) {
//       setState(() {
//         _isLoading = false;
//       });
//       // showToast('Permission is not accessible.');
//       return;
//     }
//     // Obtain assets using the path entity.
//     final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
//       onlyAll: true,
//       filterOption: _filterOptionGroup,
//     );
//     if (!mounted) {
//       return;
//     }
//     // Return if not paths found.
//     if (paths.isEmpty) {
//       setState(() {
//         _isLoading = false;
//       });
//       // showToast('No paths found.');
//       return;
//     }
//     setState(() {
//       _path = paths.first;
//     });
//     _totalEntitiesCount = await _path!.assetCountAsync;
//     final List<AssetEntity> entities = await _path!.getAssetListPaged(
//       page: 0,
//       size: _sizePerPage,
//     );
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       _entities = entities;
//       _isLoading = false;
//       _hasMoreToLoad = _entities!.length < _totalEntitiesCount;
//     });
//   }


TextEditingController nameController =TextEditingController();
var sizedBtn =SizedBox(height: 20.h,);
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: Text('PROFILE'),
        // backgroundColor: Color(0xFF075E54),
      ),
      body: Container(
        constraints: BoxConstraints(maxHeight: 1.sh),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Stack(
                         alignment: Alignment.center,
                         clipBehavior: Clip.none,
                children: [
                  Container(
        
                    decoration: const BoxDecoration(
                    shape: BoxShape.circle
                    ),
                    height: 160.h,
                    width: 160.w,
                    clipBehavior: Clip.hardEdge,

                    child: Image(image: NetworkImage('https://plus.unsplash.com/premium_photo-1675461594395-953f57818254?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8'),fit: BoxFit.cover,),
                  ),

                  Positioned(
                    
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      child: Icon(Icons.photo_camera,size: 40.sp,color: Colors.black,),
                    ),
                  )
                ],
              ),

SizedBox(height: 30.h,),
              TextFormField(

                controller: nameController,

                      decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock,),
              ),
      
              ),
            sizedBtn,
     TextFormField(
         
              ),

              SizedBox(height: 30.h,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()async{
                  // await _requestAssets();
                }, child: Text('UPDATE',
                
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}