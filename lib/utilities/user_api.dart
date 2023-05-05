import '../models/user_item.dart';
import '../models/user_list.dart';
import '../provider/user_provider.dart';
import 'caller.dart';

class UserApiService {
  // use when update user's profile
  static Future<UserItem> getUserProfile(
      String uid, UserProvider userProvider) async {
    List<UserItem> data = [];

    // Make an API call to retrieve user profile data
    try {
      final response =
      await Caller.dio.get('/api/profile/getProfile?userId=$uid');
      UserList u = UserList.fromJson(response.data);
      data = u.data;
      userProvider.setUser(
          data[0].userId,
          data[0].profileImage ?? '',
          data[0].username,
          data[0].firstname,
          data[0].lastname,
          data[0].email,
          data[0].telephone ?? '',
          data[0].lineId ?? '',
          data[0].userType);
    } catch (e) {
      print(e);
    }

    // Return the updated user profile
    return data[0];
  }
}
