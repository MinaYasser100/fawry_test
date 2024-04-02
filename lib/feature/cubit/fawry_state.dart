part of 'fawry_cubit.dart';

@immutable
sealed class FawryState {}

final class FawryInitial extends FawryState {}

final class FawryInitSDKCallback extends FawryState {}

final class FawryStartPayment extends FawryState {}

final class FawryOpenCardsManager extends FawryState {}
