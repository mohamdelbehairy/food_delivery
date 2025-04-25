abstract class AuthRepo {
  Future<bool> registerEmail(String email, String password);
  Future<bool> loginEmail(String email, String password);
}
