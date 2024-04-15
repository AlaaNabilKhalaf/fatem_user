import '../../presentation/Controller/AuthLocal/auth_cache_network.dart';

class UserModel {
  String? avatarPath;
  String? email;
  String? phoneNumber;
  String? name;

  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.avatarPath,
});

    UserModel.cacheData({
      nameF,
      emailF,
      phoneNumberF,
      avatarPathF,
    })
    {
      avatarPath = avatarPathF ;
      email = emailF;
      name =nameF;
      phoneNumber = phoneNumberF;

      toCache();
    }

  toCache(){
      return {
      CacheNetwork.insertStrings(
      key: "name", value: name?? ""),

        CacheNetwork.insertStrings(
            key: "email", value: email?? ""),

        CacheNetwork.insertStrings(
            key: "phoneNumber", value: phoneNumber?? ""),

        CacheNetwork.insertStrings(
            key: "avatarPath", value: avatarPath?? ""),
      };
  }

}