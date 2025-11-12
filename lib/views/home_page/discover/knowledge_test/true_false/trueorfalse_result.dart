import 'package:flutter/material.dart';
import 'package:umatter/components/close_button.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/result_widget.dart';

class KnowledgeResultPage extends StatefulWidget {
  final double score;
  const KnowledgeResultPage({Key? key, required this.score}) : super(key: key);

  @override
  State<KnowledgeResultPage> createState() => _KnowledgeResultPageState();
}

class _KnowledgeResultPageState extends State<KnowledgeResultPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            closeButtonWidget(context: context),
          ],
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[100],
        body: resultWidget(
          score: widget.score.toString(),
          size: _size,
          context: context,
        ),
      ),
    );
  }
}
