import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  final List<String> _departments = [
    'Computer Science (B.tech)',
    'Computer Science (BCA)',
    'Physics',
    'Botany',
    'Commerce',
    'English Studies',
    'Zoology',
    'Punjabi',
    'Education',
    'Social Science',
    'Mathematics',
    'Psychology',
    'Economics',
    'Chemistry',
    'SGGS',
    'MBA',
    'BBA',
    'BSc Medical',
    'BSc Non-Medical',
    'BSc Physiotherapy',
  ];
  List<bool> _isSelected = List.filled(20, false); // Keeps track of selected departments
  List<PlatformFile>? _files; // Store the selected files

  void _submitForm(bool sendToAll) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      if (_files != null) {
        for (var file in _files!) {
          // Handle the uploaded file, file.path contains the file path
          print('File Path: ${file.path}');
        }
      }

      if (sendToAll) {
        // Forward notice to all departments
        print('Notice forwarded to all departments');
      } else {
        for (int i = 0; i < _isSelected.length; i++) {
          if (_isSelected[i]) {
            // Forward notice to the selected department _departments[i]
            print('Notice forwarded to ${_departments[i]}');
          }
        }
      }
      // Reset form fields after submission if necessary
      _formKey.currentState!.reset();
      _isSelected = List.filled(_departments.length, false); // Reset department selections
      _files = null; // Reset selected files
    }
  }

  Future<void> _getFilesFromGallery() async {
    List<PlatformFile>? pickedFiles = [];

    try {
      pickedFiles = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'png', 'docx'],
      ))?.files;
    } catch (e) {
      print('Error picking files: $e');
    }

    setState(() {
      _files = pickedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.black,

        title: Text('Upload Notice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Notice Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the notice title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Notice Content'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the notice content';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Send Notice To:'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text('All Departments'),
                      value: _isSelected.every((element) => element == true),
                      onChanged: (value) {
                        setState(() {
                          _isSelected = List.filled(_departments.length, value!);
                        });
                      },
                    ),
                    ...List.generate(
                      _departments.length,
                      (index) => CheckboxListTile(
                        title: Text(_departments[index]),
                        value: _isSelected[index],
                        onChanged: (value) {
                          setState(() {
                            _isSelected[index] = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  
                  child: Text('Cancel', style: TextStyle(color: Colors.red),),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _submitForm(_isSelected.every((element) => element == true));
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  ),
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  ),
  child: Text('Select Department'),
),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _getFilesFromGallery,
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: NoticePage()));
