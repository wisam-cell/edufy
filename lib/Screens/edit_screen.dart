import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Helpers/style_helper.dart';
import 'package:edufly/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:image_picker/image_picker.dart';

import '../Helpers/piker_helper.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>  with StyleHelper,NavigatorHelper , PickerHelper{
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController mobileController;
  late TextEditingController homeController;
  late TextEditingController workController;
  late TextEditingController streetController;
  late TextEditingController townController;
  late TextEditingController zipCodeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dateOfBirthController = TextEditingController();
    mobileController = TextEditingController();
    homeController = TextEditingController();
    workController = TextEditingController();
    streetController = TextEditingController();
    townController = TextEditingController();
    zipCodeController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    mobileController.dispose();
    homeController.dispose();
    workController.dispose();
    streetController.dispose();
    townController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }



  File? profileImage;
  late AppLocalizations applocale = AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    late AppLocalizations applocale = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 16.sp),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(applocale.edit_accout),


        backgroundColor: Colors.transparent,
        elevation: 0,
      ),


      body:Column(
        children: [
          _buildCamGallImage,

          SizedBox(height: 23.h,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 17.w,vertical: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(applocale.personalInfo,style: TextStyle(fontSize: 16.sp,color: Color(0xff4749A0)),),
                SizedBox(height: 20.h,),


                Divider(height: 50.h,),

                Divider(height: 50.h,),


              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _buildImage{
    return Container(
          height: 300.h,
          width:double.infinity,
          decoration: BoxDecoration(
            gradient: myAppGradient(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height:120.h,
                width: 120.h,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle
                ),
                child: profileImage == null?
                CachedNetworkImage(imageUrl: temp_image,fit: BoxFit.cover,)
                :Image.file(profileImage!,fit: BoxFit.cover,),
              ),
              SizedBox(height: 15.h,),

              InkWell(
                onTap: () async {
              var file=  await pickImage();
              setState(() => profileImage =file);
                },
                  child: Text(applocale.change_image,style: TextStyle(fontSize: 16.sp,color: Colors.white),)),
              SizedBox(height: 20.h,),



            ],
          ),

        );
  }




  Widget get _buildCamGallImage{
    return Container(
      height: 300.h,
      width:double.infinity,
      decoration: BoxDecoration(
        gradient: myAppGradient(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height:120.h,
            width: 120.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                shape: BoxShape.circle
            ),
            child: profileImage == null?
            CachedNetworkImage(imageUrl: temp_image,fit: BoxFit.cover,)
                :Image.file(profileImage!,fit: BoxFit.cover,),
          ),
          SizedBox(height: 15.h,),

          InkWell(
        onTap: ()=> showModalBottomSheet(
         // isDismissible: false, // cant close the bottom sheet use it  when required option
          context: context,
           builder: (context) {
           return
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                InkWell(

                  onTap: () async {
                    var file=  await pickImage(ImageSource: ImageSource.camera);
                    setState((){
                      profileImage =file;
                      Navigator.pop(context);
                    }  );


                    },
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt_sharp,size: 30,),
                      SizedBox(width: 20,),
                      Text('Camera',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () async {
                    var file = await pickImage();
                    setState(() {
                      profileImage = file;
                      Navigator.pop(context);
                    });
                  },
                  child:const Row(
                    children: [
                      Icon(Icons.image,size: 30,),
                      SizedBox(width: 20,),
                      Text('Gallary',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                )
              ],
            ),
          );

      },)
            ,child: Text(applocale.change_image,style: TextStyle(fontSize: 16.sp,color: Colors.white),)),
          SizedBox(height: 20.h,),



        ],
      ),

    );
  }
}
