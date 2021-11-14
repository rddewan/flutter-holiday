import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:holiday/controller/holiday_controller.dart';
import 'package:holiday/data/remote/response/holiday_response.dart';
import 'package:intl/intl.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
        builder: (BuildContext context, riverpod.WidgetRef ref, _) {
      return ref.watch(holidayControllerProvider).holiday.when(data: (holiday) {
        return Expanded(
          child: Column(
            children: [
              buildHeaderTitle(),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: holiday.leaveRequests.length,
                    itemBuilder: (context, index) {
                      final item = holiday.leaveRequests[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 0, right: 16, bottom: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, top: 8),
                                        child: buildTitle(
                                            item.requestList.first.type,
                                            item.status),
                                      ),
                                      buildLeave(item.requestList, item.status),
                                      buildPersonalLeave(item.requestList),
                                    ]),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: buildStatusIcons(item.status)),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: buildStatus(item.status)),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }, error: (e, s) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text('Error: ${e.toString()}')),
              ],
            ),
          ),
        );
      }, loading: () {
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        );
      });
    });
  }

  Widget buildHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("My Request",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.event_note,
                color: Colors.lightBlue,
              ),
              SizedBox(width: 10),
              Text("Public holidays",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget buildStatusIcons(String status) {
    switch (status) {
      case 'pending':
        {
          return const Icon(
            Icons.watch_later,
            color: Colors.orange,
          );
        }
      case 'approved':
        {
          return const Icon(
            Icons.check_circle,
            color: Colors.green,
          );
        }
      case 'canceled':
        {
          return const Icon(Icons.cancel, color: Color(0xFFCFD8DC));
        }
      default:
        {
          return const Icon(
            Icons.watch_later,
            color: Colors.orange,
          );
        }
    }
  }

  Widget buildTitle(String type, String status) {
    String _type = '';
    TextStyle _textStyle = const TextStyle();
    switch (type) {
      case 'personal_leave':
        {
          _type = "Leave";
          if (status == 'canceled') {
            _textStyle = const TextStyle(
                color: Color(0xFFCFD8DC),
                fontSize: 18,
                fontWeight: FontWeight.w900);
          } else {
            _textStyle = const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900);
          }
          break;
        }
      case 'remote':
        {
          _type = "Leave";
          if (status == 'canceled') {
            _textStyle = const TextStyle(
                color: Color(0xFFCFD8DC),
                fontSize: 18,
                fontWeight: FontWeight.w900);
          } else {
            _textStyle = const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900);
          }
          break;
        }
      case 'switch_holiday':
        {
          _type = "Switch";
          if (status == 'canceled') {
            _textStyle = const TextStyle(
                color: Color(0xFFCFD8DC),
                fontSize: 18,
                fontWeight: FontWeight.w900);
          } else {
            _textStyle = const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900);
          }
          break;
        }
      case 'sick_leave':
        {
          _type = "Leave";
          if (status == 'canceled') {
            _textStyle = const TextStyle(
                color: Color(0xFFCFD8DC),
                fontSize: 18,
                fontWeight: FontWeight.w900);
          } else {
            _textStyle = const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900);
          }
          break;
        }
      default:
        {
          _type = "Leave";
        }
    }

    return Text(_type, style: _textStyle);
  }

  Widget buildPersonalLeave(List<RequestList> data) {
    var sorted = data..sort((item1, item2) => item1.date.compareTo(item2.date));
    var personal = sorted.where((element) => element.type == 'personal_leave');
    var sb = StringBuffer();
    DateFormat dateFormat = DateFormat("dd MMM yyyy");
    var counter = 0;
    for (var item in personal) {
      var date = DateTime.parse(item.date);
      var dateTime = dateFormat.format(date);

      if (counter == 0) {
        counter++;
        sb.write(dateTime.substring(0, 2) + '-');
      } else {
        sb.write(dateTime + ' ');
      }
    }
    if (sb.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.flight_takeoff_outlined, color: Colors.black54),
          const SizedBox(
            width: 12,
          ),
          Text(sb.toString(),
              style: const TextStyle(color: Colors.black54, fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildLeave(List<RequestList> data, String status) {
    var sortedList = data
      ..sort((item1, item2) => item1.date.compareTo(item2.date));
    var filteredList =
        sortedList.where((element) => element.type != 'personal_leave');
    var sb = StringBuffer();
    late Icon _icon;
    late Text _text;

    DateFormat dateFormat = DateFormat("dd MMM yyyy");
    for (var item in filteredList) {
      var date = DateTime.parse(item.date);
      var dateTime = dateFormat.format(date);
      sb.write(dateTime.toString());

      if (status == 'canceled') {
        if (item.type == 'switch_holiday') {
          _icon =
              const Icon(Icons.switch_left_outlined, color: Color(0xFFCFD8DC));
        }
        if (item.type == 'sick_leave') {
          _icon = const Icon(Icons.medical_services_outlined,
              color: Color(0xFFECEFF1));
        }
        if (item.type == 'remote') {
          _icon = const Icon(Icons.computer_outlined, color: Color(0xFFCFD8DC));
        }

        _text = Text(sb.toString(),
            style: const TextStyle(color: Color(0xFFCFD8DC), fontSize: 16));
      } else {
        if (item.type == 'switch_holiday') {
          _icon = const Icon(Icons.switch_left_outlined, color: Colors.black54);
        }
        if (item.type == 'sick_leave') {
          _icon = const Icon(Icons.medical_services_outlined,
              color: Colors.black54);
        }
        if (item.type == 'remote') {
          _icon = const Icon(Icons.computer_outlined, color: Colors.black54);
        }

        _text = Text(sb.toString(),
            style: const TextStyle(color: Colors.black54, fontSize: 16));
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _icon,
          const SizedBox(
            width: 12,
          ),
          _text,
        ],
      ),
    );
  }

  Widget buildStatus(String status) {
    switch (status) {
      case 'pending':
        {
          return Text(StringUtils.capitalize(status),
              style: const TextStyle(color: Colors.black54, fontSize: 16));
        }
      case 'approved':
        {
          return Text(StringUtils.capitalize(status),
              style: const TextStyle(color: Colors.black54, fontSize: 16));
        }
      case 'canceled':
        {
          return Text(StringUtils.capitalize(status),
              style: const TextStyle(color: Colors.grey, fontSize: 16));
        }
      default:
        {
          return Text(StringUtils.capitalize(status),
              style: const TextStyle(color: Colors.black54, fontSize: 16));
        }
    }
  }
}
