import 'package:flutter/material.dart';
import 'package:reservation_app/pages/comfirm_reservation/bottom_sheet_comfirm_reservation.dart';

enum Province { hcm, haNoi, vungTau }

const List<String> list = <String>[
  '18h30 - 19h00',
  '18h30 - 19h00',
  '18h30 - 19h00'
];

class ReservationTab extends StatefulWidget {
  const ReservationTab({Key? key}) : super(key: key);

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {
  Province? _province;
  bool _isChecked = false;

  final List<DayTimeWeek> _listDay = [
    DayTimeWeek(th: 'MO', date: '23'),
    DayTimeWeek(
      th: 'TU',
      date: ' 24',
    ),
    DayTimeWeek(
      th: 'WE',
      date: ' 25',
    ),
    DayTimeWeek(th: 'TH', date: ' 26'),
    DayTimeWeek(
      th: 'FR',
      date: ' 27',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 42,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.medical_information,
                            color: Colors.red,
                          ),
                          hintText: "Must have Vaccinated Card ",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 42,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.camera_alt_sharp,
                            color: Colors.red,
                          ),
                          hintText: "Deposit for reservation",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Pick your date",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 135,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButtonFormField<Province>(
                          value: _province,
                          icon: const Icon(Icons.chevron_left),
                          items: const [
                            DropdownMenuItem(
                                child: Text('Ho Chi Minh'),
                                value: Province.hcm),
                            DropdownMenuItem(
                                child: Text('Ha Noi'), value: Province.haNoi),
                            DropdownMenuItem(
                              child: Text('Vung Tau'),
                              value: Province.vungTau,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _province = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 57,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                          child: Text(
                        "2021",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.chevron_left),
                        Container(
                          width: 49,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34)),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Text("MO"),
                            ],
                          )),
                        ),
                        Container(
                          width: 49,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34)),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Text("MO"),
                            ],
                          )),
                        ),
                        Container(
                          width: 49,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34)),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Text("MO"),
                            ],
                          )),
                        ),
                        Container(
                          width: 49,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34)),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Text("MO"),
                            ],
                          )),
                        ),
                        Container(
                          width: 49,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34)),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Text("MO"),
                            ],
                          )),
                        ),
                        Container(
                          width: 49,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34)),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Text("MO"),
                            ],
                          )),
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pick your date",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 135,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonFormField<Province>(
                            value: _province,
                            icon: const Icon(Icons.chevron_left),
                            items: const [
                              DropdownMenuItem(
                                  child: Text('18h00-19h00'),
                                  value: Province.hcm),
                              DropdownMenuItem(
                                  child: Text('18h00-19h00'),
                                  value: Province.haNoi),
                              DropdownMenuItem(
                                child: Text('18h00-19h00'),
                                value: Province.vungTau,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _province = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "How many people?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Icon(Icons.remove))),
                              ),
                              const Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Icon(Icons.add))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = !_isChecked;
                          });
                        },
                      ),
                      Text(
                        "Vaccine green passes",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Notes",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 69),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    maxLines: 5, // <-- SEE HERE
                    minLines: 1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("Your information",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Full name",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.black),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.black),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.black),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                  Text(
                    "I agree with restaurant terms of service",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  width: 346,
                  height: 46,
                  decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          builder: (context) => const BottomSheetConfirmReservation(),
                        );
                      },
                      child: const Text(
                        "RESERVE",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ))),
            ),
          ],
        )
      ],
    );
  }
}

class DayTimeWeek {
  final String th;
  final String date;

  DayTimeWeek({required this.th, required this.date});
}
