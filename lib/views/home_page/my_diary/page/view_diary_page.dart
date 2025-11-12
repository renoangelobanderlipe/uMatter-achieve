import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ViewDiaryPage extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;
  final emotion;
  const ViewDiaryPage({
    Key? key,
    required this.data,
    required this.time,
    required this.ref,
    required this.emotion,
  }) : super(key: key);

  @override
  _ViewDiaryPageState createState() => _ViewDiaryPageState();
}

class _ViewDiaryPageState extends State<ViewDiaryPage> {
  bool isEdit = false;
  String? title;
  String? desc;
  String? emotion;

  final myEmotions = [
    "😄 Happy",
    "😭 Crying",
    "😎 Cool",
    "😍 Love",
    "😱 Shock",
    "😴 Sleepy",
    "🤔 Thinking",
    "😔 Tired",
    "🙁 Lonely",
    "😡 Angry",
    "😇 Blessed",
    "😥 Exhausted",
    "🤤 Drooling"
  ];

  final message = const SnackBar(
    content: Text('Save'),
  );

  final delete = const SnackBar(
    content: Text('Deleted'),
  );

  final ktextStyle = const TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    letterSpacing: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    title = widget.data['title'];
    desc = widget.data['description'];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: const Center(
                    child: Text(
                      'Are you sure you want to continue?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  content: const Text(
                    """Are you willing to share your journal entries, should you opt to consult with a licensed professional?""",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: Colors.red[600],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        IconButton(
                          onPressed: () {
                            shareDiary(context);
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.share,
              color: Colors.grey[800],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = !isEdit;
              });
            },
            icon: isEdit
                ? IconButton(
                    onPressed: updateForm,
                    icon: FaIcon(
                      FontAwesomeIcons.save,
                      color: Colors.grey[800],
                    ))
                : Icon(
                    Icons.edit,
                    color: Colors.grey[800],
                  ),
          ),
          IconButton(
            onPressed: deleteForm,
            icon: Icon(
              Icons.delete,
              color: Colors.grey[800],
            ),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.grey[600],
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // create at
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.time} ".toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // Emotions
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.orange[300],
                  ),
                  child: selectedEmoji(),
                ),
                const SizedBox(
                  height: 30.0,
                ),

                // Title Field
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    // fillColor: Colors.grey[300],
                  ),
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                  initialValue: widget.data['title'],
                  enabled: isEdit,
                  validator: (value) =>
                      value!.isEmpty ? "Please add a Title" : null,
                  onChanged: (_val) {
                    title = _val;
                  },
                ),

                const SizedBox(
                  height: 30.0,
                ),
                // Description
                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    // fillColor: Colors.grey[300],
                    filled: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  initialValue: widget.data['description'],
                  enabled: isEdit,
                  validator: (value) => value != null && value.isEmpty
                      ? "Please add a Description"
                      : null,
                  onChanged: (_val) {
                    desc = _val;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteForm() async {
    await widget.ref.delete();
    ScaffoldMessenger.of(context).showSnackBar(delete);
    Navigator.pop(context);
  }

  void updateForm() async {
    ScaffoldMessenger.of(context).showSnackBar(message);
    await widget.ref.update({"title": title, 'description': desc});
    Navigator.of(context).pop();
  }

  void shareDiary(BuildContext context) async {
    String diary =
        "Emotion: ${widget.emotion} \nTitle: $title \n\nDescription: $desc";
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(diary,
        subject: 'Description',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  selectedEmoji() {
    if (widget.data['emotions'] == "Happy") {
      return Text(myEmotions[0], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Crying") {
      return Text(myEmotions[1], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Cool") {
      return Text(myEmotions[2], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Love") {
      return Text(myEmotions[3], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Shock") {
      return Text(myEmotions[4], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Sleepy") {
      return Text(myEmotions[5], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Thinking") {
      return Text(myEmotions[6], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Tired") {
      return Text(myEmotions[7], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Lonely") {
      return Text(myEmotions[8], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Blessed") {
      return Text(myEmotions[9], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Love") {
      return Text(myEmotions[10], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Exhausted") {
      return Text(myEmotions[11], style: ktextStyle);
    }
    if (widget.data['emotions'] == "Drooling") {
      return Text(myEmotions[12], style: ktextStyle);
    }
  }
}
