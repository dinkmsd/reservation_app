import 'package:reservation_app/data/reservation_state.dart';

class ReservationModel {
  final String? reservationId;
  final String? imageAddress;
  final String? date;
  final String? address;
  final int? personNumber;
  final String? timeSlot;
  final ReservationState? state;

  ReservationModel(
      {this.reservationId,
      this.imageAddress,
      this.date,
      this.address,
      this.personNumber,
      this.timeSlot,
      this.state});
}

final List<ReservationModel> reservationMockDataList = [
  ReservationModel(
      imageAddress: 'assets/images/images/image_example_02.png',
      address: 'An BBQ Su Van Hanh',
      personNumber: 2,
      reservationId: '716001',
      date: '01/10/2023',
      timeSlot: '18h00 - 18h30',
      state: ReservationState.finished),
  ReservationModel(
      imageAddress: 'assets/images/images/image_example.png',
      address: 'An BBQ Dong Khoi',
      personNumber: 3,
      reservationId: '234001',
      date: '12/09/2023',
      timeSlot: '9h00 - 12h30',
      state: ReservationState.reserved),
  ReservationModel(
      imageAddress: 'assets/images/images/image_example_03.png',
      address: 'An BBQ Hoang Hoa Tham',
      personNumber: 5,
      reservationId: '123456',
      date: '19/09/2023',
      timeSlot: '19h00 - 20h30',
      state: ReservationState.pending),
  ReservationModel(
      imageAddress: 'assets/images/images/image_example_04.png',
      address: 'An BBQ Le Quy Don',
      personNumber: 4,
      reservationId: '999999',
      date: '02/07/2023',
      timeSlot: '15h00 - 20h00',
      state: ReservationState.finished),
  ReservationModel(
      imageAddress: 'assets/images/images/image_example_05.png',
      address: 'An BBQ Le Thanh Ton',
      personNumber: 10,
      reservationId: '111111',
      date: '10/06/2023',
      timeSlot: '17h00 - 20h00',
      state: ReservationState.pending),
];