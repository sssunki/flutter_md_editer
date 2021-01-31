import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  RichTextEditingController controller;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    controller = RichTextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Markdown(
        data: "## data",
        selectable: true,
      ),
      // body: MdEditField(controller)
      // body: MdEditField(),
    );
  }
}

class MdEditField extends StatefulWidget {
  RichTextEditingController controller;

  MdEditField(this.controller);

  @override
  State<StatefulWidget> createState() => MdEditFieldState();
}

class MdEditFieldState extends State<MdEditField> {
  List<TextField> lists = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TestClass cs = TestClass();
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "test",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        onChanged: (input) {
          if (input.endsWith("\n")) {
            print("on return ${widget.controller == null}");
            setState(() {});
          }
        },
      ),
    );
  }
}

_parseMarkdown() {
  md.Document document = md.Document(encodeHtml: false);
}

class RichTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({TextStyle style, bool withComposing}) {
    return TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        children: []);
  }
}

class TestClass {
  String name;
  String game;
}
