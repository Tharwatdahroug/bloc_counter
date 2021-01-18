// import 'dart:async';
// import './conut.dart';

// class couter_bloc {
//   int _counte = 0;

//   final _countstreamControll = StreamController<int>();
//   StreamSink<int> get _incount => _countstreamControll.sink;
//   Stream<int> get outcount => _countstreamControll.stream;

//   final _countEventControll = StreamController<CounterEvent>();
//   Sink<CounterEvent> get countEvent => _countEventControll.sink;

//   couter_bloc() {
//     _countEventControll.stream.listen(coutdata);
//   }

//   void coutdata(CounterEvent event) {
//     if (event is incremenCounter) {
//       _counte++;
//     } else {
//       _counte--;
//     }
//     _incount.add(_counte);
//   }

//   void dispose() {
//     _countstreamControll.close();
//     _countEventControll.close();
//   }
// }
