import 'package:flutter/material.dart';

class SuggestionFormScreen extends StatefulWidget {
  @override
  _SuggestionFormScreenState createState() => _SuggestionFormScreenState();
}

class _SuggestionFormScreenState extends State<SuggestionFormScreen> {
  late String _selectedCategory = 'Academics';

  bool _isAnonymous = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Suggestion Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropdownButtonFormField(
                value: _selectedCategory,
                items: ['Academics', 'Facilities', 'Student Services']
                    .map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title/Subject'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _attachmentController,
                decoration: InputDecoration(labelText: 'Attachment (Optional)'),
              ),
              SizedBox(height: 10.0),
              CheckboxListTile(
        title: Text('Submit Anonymously'),
        value: _isAnonymous,
        onChanged: (bool? value) {
          if (value != null) {
        setState(() {
          _isAnonymous = value;
        });
          }
        },
      ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  String attachment = _attachmentController.text;
      
                  // TODO: Implement form submission logic
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
