enum ReservationState {
  reserved,
  pending,
  deposited,
  confirmed,
  finished,
  cancelled
}

extension ReservationStateExt on ReservationState {
  String convertToString(){
    switch (this) {
      case ReservationState.reserved:
        return 'Reserved';
      case ReservationState.pending:
        return 'Pending';
      case ReservationState.deposited:
        return 'Deposited';

      case ReservationState.confirmed:
        return 'Confirmed';

      case ReservationState.finished:
        return 'Finished';
      default:
        return 'Cancelled';
    }
  }
}

extension ReservationStateFromString on String?{
  ReservationState convertToReservationState(){
    switch(this){
      case 'Reserved': return ReservationState.reserved;
      case 'Pending': return ReservationState.pending;
      case 'Deposited': return ReservationState.deposited;
      case 'Confirmed': return ReservationState.confirmed;
      case 'Finished': return ReservationState.finished;
      default: return ReservationState.cancelled;
    }
  }
}
