import 'package:finology/Api/api.dart';
import 'package:finology/Models/recent_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  // ignore: deprecated_member_use
  var lstusers = RecentPeoples().obs;

  var lstFaces = <Faces>[].obs;

  Future<void> fetchData() async {
    RecentPeoples lstUsersDetail = await ApiProvider().apiRecentPeoples();
    if (lstUsersDetail.faces != null && lstUsersDetail.faces!.isNotEmpty) {
      lstFaces.value = lstUsersDetail.faces!;
    }
    lstusers.value = lstUsersDetail;
  }
}
