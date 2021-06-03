import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/app.module.dart';
import 'package:v_post/app/components/app-title/app-title.component.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/components/common-button/common-button.component.dart';
import 'package:v_post/app/components/text-field/text-field.component.dart';
import 'package:v_post/app/home/user/delivery/delivery.module.dart';
import 'package:v_post/app/home/user/delivery/place-picking/place-picking.view.dart';
import 'package:v_post/app/home/user/home.module.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';

class _NestedData {
  String hintText;
  Icon icon;
  String name;

  _NestedData({required this.name, required this.hintText, required this.icon});
}

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  _DeliveryWidgetState createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  List<MapEntry<String, List<_NestedData>>> _allForm = [
    MapEntry(
      "Người gửi",
      [
        _NestedData(name: "sender_name", hintText: "Họ và tên", icon: Icon(Icons.person_outlined)),
        _NestedData(name: "sender_phone", hintText: "Số điện thoại", icon: Icon(Icons.call_outlined)),
        _NestedData(name: "sender_address", hintText: "Địa chỉ", icon: Icon(Icons.place_outlined)),
      ],
    ),
    MapEntry(
      "Người nhận",
      [
        _NestedData(name: "receiver_name", hintText: "Họ và tên", icon: Icon(Icons.person_outlined)),
        _NestedData(name: "receiver_phone", hintText: "Số điện thoại", icon: Icon(Icons.call_outlined)),
        _NestedData(name: "receiver_address", hintText: "Địa chỉ", icon: Icon(Icons.place_outlined)),
      ],
    ),
    MapEntry(
      "Hàng hoá",
      [
        _NestedData(name: "package_name", hintText: "Tên hàng hóa", icon: Icon(Icons.all_inbox_outlined)),
        _NestedData(name: "package_price", hintText: "Giá trị", icon: Icon(Icons.attach_money_outlined)),
        _NestedData(name: "package_weight", hintText: "Khối lượng (gam)", icon: Icon(Icons.line_weight_outlined)),
        _NestedData(name: "package_description", hintText: "Mô tả", icon: Icon(Icons.description_outlined)),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        title: AppTitle(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: FormBuilder(
            key: _fbKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Text(
                  "Giao hàng",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                ..._allForm.map((e) => buildGroupTextField(title: e.key, data: e.value)),
                SizedBox(height: SizeConfig.safeBlockVertical * 5),
                Align(
                  alignment: Alignment.center,
                  child: CommonButton(
<<<<<<< HEAD
                    // onPressed: () => Modular.to
                    //     .pushNamed(AppModule.user + UserHomeModule.delivery + UserHomeModule.delivery + DeliveryModule.deliveryConfirmation),
                    onPressed: () {
                      print(AppModule.user + UserHomeModule.delivery + DeliveryModule.placePicking);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlacePicking()));
                      // Modular.to.pushNamed(AppModule.user + UserHomeModule.delivery + DeliveryModule.placePicking);
                    },
=======
                    onPressed: () => Modular.to.pushNamed(AppModule.user + UserHomeModule.delivery + DeliveryModule.deliveryConfirmation),
>>>>>>> f9eef9ed6f7c1905e4f56c5d581b5ddcc2f3214b
                    child: Text(
                      "Tiếp theo",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    backgroundColor: AppColor.accentColor,
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGroupTextField({required String title, required List<_NestedData> data}) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor, fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            ...data.map(
              (e) => e.hintText != "Địa chỉ"
                  ? TextFieldView(name: e.name, type: 'text_field', hintText: e.hintText, prefixIcon: e.icon)
                  : buildCustomAddressForm(e),
            ),
          ],
        ),
      );

  Widget buildCustomAddressForm(_NestedData e) => Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
        child: FormBuilderTextField(
          name: e.name,
          maxLines: 1,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: e.hintText,
            hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF7A7A7A)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.accentColor, width: 1.25, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.accentColor, width: 1.25, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(13),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.errorColor, width: 1.25, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.errorColor, width: 1.25, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(13),
            ),
            prefixIcon: e.icon,
          ),
          // Todo: uncomment to navigate to place picking.
          // onTap: () => Modular.to.pushNamed(AppModule.user + UserHomeModule.delivery + DeliveryModule.placePicking),
          keyboardType: TextInputType.text,
          validator: FormBuilderValidators.required(context),
        ),
      );
}
