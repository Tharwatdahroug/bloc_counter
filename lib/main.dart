import 'package:bloc_p/bloc/bloc_count.dart';
import 'package:bloc_p/bloc_petern/bloc_event.dart';
import 'package:bloc_p/bloc_petern/count_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import './bloc_petern/conut.dart';
// import './bloc_petern/count_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = counterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: counterWidget(
        widget: widget,
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}

class counterWidget extends StatelessWidget {
  final MyHomePage widget;

  const counterWidget({Key key, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        cubit: BlocProvider.of<counterBloc>(context),
        builder: (context, CounterState counterState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${counterState.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => BlocProvider.of<counterBloc>(context).onIncremen(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 4,
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<counterBloc>(context).ondncremen(),
            tooltip: 'dcremen',
            child: Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
