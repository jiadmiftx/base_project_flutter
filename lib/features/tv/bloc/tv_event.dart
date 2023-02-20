part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataTvEvent extends TvEvent {
  final String type;
  const DataTvEvent({required this.type});

  @override
  List<Object> get props => <Object>[type];
}

class DataDetailTvEvent extends TvEvent {
  final int tvid;

  const DataDetailTvEvent({required this.tvid});

  @override
  List<Object> get props => <Object>[tvid];
}

class ReviewDetailTvEvent extends TvEvent {
  final int tvid;

  const ReviewDetailTvEvent({required this.tvid});

  @override
  List<Object> get props => <Object>[tvid];
}
