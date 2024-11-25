import 'package:cached_network_image/cached_network_image.dart';
import 'package:edufly/DB/Controllers/product_db_controller.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Screens/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/DB/product_model.dart';
import '../temp.dart';
class ProductItem extends StatelessWidget with NavigatorHelper {
  final ProductModel product;
  const ProductItem({
   required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      jump(context, to: AddProductScreen(product: product,));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                border: Border.all(
                    color: Colors.black,width: .8.w
                )
            ),
            child: Row(
              children: [
                Container(
          
                  clipBehavior: Clip.antiAlias,
                  height: 70.h,
                  width:70.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: CachedNetworkImage(imageUrl: temp_image,fit: BoxFit.cover,),
          
          
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
          
                    children: [
                      Text(product.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text('product price :\$ ${product.price}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),)
                    ],
                  ),
                )
          
          
              ],
            ),
          ),
          PositionedDirectional(
            end: 0,
            child: IconButton(
                onPressed: () async{
            var result= await ProductDbController().delete(product);
              print(result);
            }, icon: Icon(Icons.delete,color: Colors.red,)),
          )
        ],
      ),
    );
  }



}