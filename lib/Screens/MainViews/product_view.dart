
import 'package:cached_network_image/cached_network_image.dart';
import 'package:edufly/DB/Controllers/product_db_controller.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Models/DB/product_model.dart';
import 'package:edufly/Screens/add_product_screen.dart';
import 'package:edufly/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/product_item.dart';
class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>with NavigatorHelper {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts;
  }
  List<ProductModel>? products;
  Future<void> get getProducts async{
  var list = await ProductDbController().read(); // to bring data and read all data
   setState(() {
     products = list;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title:Text( "PRODUCTS",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      actions: [
        IconButton(onPressed: () => jump(context,to: AddProductScreen()),
            icon: Icon(Icons.add,color: Colors.white,))
      ],
      ),
      body:products != null?
          products!.isNotEmpty?
      ListView.separated(
        shrinkWrap: true,
        itemCount: products!.length,
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
          itemBuilder: (context, index) {
          return ProductItem(product: products![index],);

          },
          separatorBuilder:(context, index) => SizedBox(height: 10,),
         ):Column(
            children: [Text('no data')],
          )
          :const Center(child: CircularProgressIndicator(),),
    );
  }
}


