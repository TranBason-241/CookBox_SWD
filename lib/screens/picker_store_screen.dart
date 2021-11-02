import 'package:app/getx/controller/menu_detail_controller.dart';
import 'package:app/getx/controller/store_controller.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickerStoreSreen extends GetView<StoreController> {
  StoreController storecontroller = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Chọn cửa hàng'),
      ),
      // body: Obx(() => controller.store.value == null
      //     ? CircularProgressIndicator()
      //     : DropdownButton(
      //         hint: Text(
      //           'Book Type',
      //         ),
      //         onChanged: (newValue) {
      //           controller.setSelected(newValue.toString());
      //         },
      //         value: controller.selected.value,
      //         items: controller.store.value!.items!.map((selectedType) {
      //           return DropdownMenuItem(
      //             child: Text(
      //               selectedType.address!,
      //             ),
      //             value: selectedType.address,
      //           );
      //         }).toList(),
      //       )),
      body: Obx(
        () => controller.store.value == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: controller.store.value!.items!.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                            leading: const Icon(
                              Icons.store_mall_directory,
                              color: Color(0xfff32726),
                              size: 40,
                            ),
                            subtitle: Text(
                                '${controller.store.value!.items![index].name}'),
                            title: Text(
                              'Tên cửa hàng ',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                var prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('storeId',
                                    '${controller.store.value!.items![index].id}');
                                prefs.setString('storeName',
                                    '${controller.store.value!.items![index].name}');
                                // Get.toNamed(HomeScreen.routeName, arguments: {
                                //   'storeName',
                                //   controller.store.value!.items![index].name
                                // });
                                storecontroller.setSelected(controller.store.value!.items![index].id!);
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${controller.store.value!.items![index].address}'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
