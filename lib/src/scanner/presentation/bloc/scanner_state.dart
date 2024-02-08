part of 'scanner_bloc.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();
  
  @override
  List<Object> get props => [];
}

final class ScannerInitial extends ScannerState {}
