abstract class ProfileStates {}

class ProfileStateInitial extends ProfileStates {}

class ProfileStateLoading extends ProfileStates {}

class ProfileStateSuccess extends ProfileStates {}

class ProfileStateError extends ProfileStates {
  final error;

  ProfileStateError(this.error);
}
