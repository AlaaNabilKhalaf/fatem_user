abstract class AuthStates {}
class AuthInitialState extends AuthStates {}

class GoogleAuthLoading extends AuthStates {}
class GoogleAuthSuccess extends AuthStates {}
class GoogleAuthFailed extends AuthStates {}
class GoogleAuthLoggedOUT extends AuthStates {}


