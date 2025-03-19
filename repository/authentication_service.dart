Future<UserEntity?> signInWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    var userCredential = await AuthenticationApi().login(
      email,
      password,
    );

    if (userCredential?.code?.toString() == "OK") {
      AuthenticationApi()
          .setToken(userCredential?.data?.accessToken?.tokenString.toString());
      AuthenticationApi().setUserDetails(userCredential);
    }
    return userCredential;
  } on Exception catch (e) {
    rethrow;
  }
}
