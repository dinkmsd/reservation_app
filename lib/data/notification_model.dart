class NotificationModel {
  final String reservationId;
  final String date;
  final String? deposit;

  NotificationModel(
      {required this.reservationId, required this.date, this.deposit});
}

final List<NotificationModel> notificationListMockData = [
  NotificationModel(reservationId: '123456', date: ' 19:30 19-09-2021'),
  NotificationModel(
      reservationId: '123456', date: ' 19:30 19-09-2021', deposit: '400.000'),
  NotificationModel(
      reservationId: '123456', date: ' 19:30 19-09-2021', deposit: '450.000'),
  NotificationModel(reservationId: '123456', date: ' 19:30 19-09-2021'),
  NotificationModel(
      reservationId: '123456', date: ' 19:30 19-09-2021', deposit: '600.000'),
];