import 'package:edufly/DB/Controllers/product_db_controller.dart';
import 'package:edufly/Models/DB/product_model.dart';
import 'package:edufly/Widgets/my_button.dart';
import 'package:edufly/Widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddProductScreen extends StatefulWidget {
  final ProductModel? product;
  const AddProductScreen({
    this.product,
    super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController nameEditingController ;
  late TextEditingController priceEditingController ;
  @override
  void initState() {

    super.initState();
    nameEditingController = TextEditingController(text: widget.product?.name ?? '');
    priceEditingController = TextEditingController(text: widget.product?.price.toString() ?? '');
  }
  @override
  void dispose() {

    nameEditingController.dispose();
    priceEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,

        title: widget.product == null ?
        _addProduct :_editProduct,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              children: [
                MyTextField(
                  onChanged: (p0) {
                  setState(() {
                  });
                },
                  controller: nameEditingController,
                  isPhone: false,
                  TextColor: Colors.black,
                  hint: 'Type your name',
                  Border_Color: Colors.black,
                ),
               SizedBox(height: 20.h,),
                MyTextField(
                  onChanged: (p0) {
                  setState(() {
                  });
                },
                  controller: priceEditingController
                  ,isPhone: false,
                  TextColor: Colors.black,
                  hint: 'price',
                  Border_Color: Colors.black,)
              ],
            ),
            
          ),
          MyButton(text:  widget.product == null ?
          'Add Product' :'Edit Product',

            txtColor: Colors.white,
            backGroundColor: _activeButton ?Colors.blue:Colors.grey,
            on_tap: _activeButton ?() async{
            await _performAction();
            }
            :null,
            loading: loading,

          )
        ],
      )
    );
  }

  Future<void> _performAction() async{
    if(_checkData()){
      await _action();
    }

  }
  bool loading =false;
  Future<void> _action() async{
    setState(()=> loading = true);
    if(widget.product == null){
      await ProductDbController().create(ProductModel(
        name: nameEditingController.text,
        price:num.parse(priceEditingController.text) ,
      ));
    }else if(widget.product != null){
      await ProductDbController().update(ProductModel(
        id: widget.product!.id,
        name: nameEditingController.text,
        price:num.parse(priceEditingController.text) ,
      ));
    }

    setState(()=> loading = false);
    Navigator.pop(context);

  }

  bool _checkData(){
    if(_activeButton){
      return true;
    }else{
      SnackBar(content: Text('fill your name and price',
      style: TextStyle(color: Colors.blue),
      ),
      clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 200.h),
      backgroundColor: Colors.white,
        duration: Duration(seconds: 2),
        width: double.infinity,
      );
      return false;
    }
      
    
  }



Text get _addProduct {
    return Text('Add Product',style: TextStyle(color: Colors.white),);
}
  Widget get _editProduct{
    return Text('edit Product',style: TextStyle(color: Colors.white),);
  }


  bool get _activeButton =>
      nameEditingController.text.isNotEmpty&&priceEditingController.text.isNotEmpty;
}
