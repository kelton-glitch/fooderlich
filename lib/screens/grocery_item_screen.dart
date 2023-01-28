import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../components/grocery_tile.dart';

class GroceryItemScreen extends StatefulWidget {
  //1
  final Function(GroceryItem) onCreate;
  //2
  final Function(GroceryItem) onUpdate;
  //3
  final GroceryItem? originalItem;
  //4
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
}) : isUpdating = (originalItem != null);

  @override
  GroceryItemScreenState createState() => GroceryItemScreenState();
}

  class GroceryItemScreenState extends State<GroceryItemScreen> {
  //TODO: Add grocery item screen state properties
    final _nameController = TextEditingController();
    String _name = '';
    Importance _importance = Importance.low;
    DateTime _dueDate = DateTime.now();
    TimeOfDay _timeOfDay = TimeOfDay.now();
    Color _currentColor = Colors.green;
    int _currentSliderValue = 0;

    //Initialization stage
    @override
    void initState(){
      super.initState();
      //1
      final originalItem = widget.originalItem;
      if (originalItem != null) {
        _nameController.text = originalItem.name;
        _name = originalItem.name;
        _currentSliderValue = originalItem.quantity;
        _importance = originalItem.importance;
        _currentColor = originalItem.color;
        final date = originalItem.date;
        _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
        _dueDate = date;
      }

      //2
      _nameController.addListener(() {
        setState(() {
          _name = _nameController.text;
        });
      });
    }
    //Disposes the TextEditingController when no longer needed
    @override
    void dispose(){
      _nameController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      //GroceryItemScreen Scaffold
      return Scaffold(
        //2
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: (){
                //callback handler
                final groceryItem = GroceryItem(
                    id: widget.originalItem?.id ?? const Uuid().v1(),
                    name: _nameController.text,
                    importance: _importance,
                    color: _currentColor,
                    quantity: _currentSliderValue,
                    date: DateTime(
                      _dueDate.year,
                      _dueDate.month,
                      _dueDate.day,
                      _dueDate.hour,
                      _dueDate.minute,
                    ),
                );

                if (widget.isUpdating) {
                  widget.onUpdate(groceryItem);
                } else {
                  widget.onCreate(groceryItem);
                }
              },)
          ],
          //3
          elevation: 0.0,
          //4
          title: Text(
            'Grocery Item',
            style: GoogleFonts.lato(fontWeight: FontWeight.w600),
          ),
        ),
        //5
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              //TextField
              buildNameField(),
              //Importance selection
              buildImportanceField(),
              //date picker
              buildDateField(context),
              //time picker
              buildTimeField(context),
              //color picker
              const SizedBox(height: 10.0),
              buildColorField(context),
              //slider
              const SizedBox(height: 10.0),
              buildQuantityField(),
              //Grocery Tile
              GroceryTile(
                item: GroceryItem(
                  id: 'previewMode',
                  name: _name,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  date: DateTime(
                    _dueDate.year,
                    _dueDate.month,
                    _dueDate.day,
                    _dueDate.hour,
                    _dueDate.minute,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    //buildNameField()
  Widget buildNameField() {
      //1
    return Column(
      //2
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //3
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        //4
        TextField(
          //5
          controller: _nameController,
          //6
          cursorColor: _currentColor,
          //7
          decoration: InputDecoration(
            //8
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            //9
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
      ],
    );
  }

    //buildImportanceField()
  Widget buildImportanceField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //2
          Text(
              'Importance',
            style: GoogleFonts.lato(fontSize: 28.0),
          ),
          //3
          Wrap(
            spacing: 10.0,
            children: [
              //4
              ChoiceChip(
                //5
                selectedColor: _currentColor,
                //6
                selected: _importance == Importance.low,
                label: const Text(
                  'low',
                  style: TextStyle(color: Colors.white),
                ),
                //7
                onSelected: (selected) {
                  setState(() => _importance = Importance.low);
                },
              ),
              ChoiceChip(
                selectedColor: _currentColor,
                selected: _importance == Importance.medium,
                label: const Text(
                  'medium',
                  style: TextStyle(color: Colors.white),
                ),
                //7
                onSelected: (selected) {
                  setState(() => _importance = Importance.medium);
                },
              ),
              ChoiceChip(
                selectedColor: _currentColor,
                selected: _importance == Importance.high,
                label: const Text(
                  'high',
                  style: TextStyle(color: Colors.white),
                ),
                //7
                onSelected: (selected) {
                  setState(() => _importance = Importance.high);
                },
              ),
            ],
          )
        ],
      );
  }

    //buildDateField()
  Widget buildDateField(BuildContext context) {
      //1
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //2
        Row(
          //3
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //4
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            //5
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                //7
                final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: currentDate,
                    lastDate: DateTime(currentDate.year + 5),
                );
                //8
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        //9
        Text(DateFormat('yyy-MMM-dd').format(_dueDate)),
      ],
    );
  }

    //buildTimeField()
  Widget buildTimeField(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time of Day',
                style: GoogleFonts.lato(fontSize: 28.0),
              ),
              TextButton(
                  child: const Text('Select'),
                  onPressed: () async {
                    //1
                    final timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    //3
                    setState(() {
                      if (timeOfDay != null) {
                        _timeOfDay = timeOfDay;
                      }
                    });
                  } ,
              ),
            ],
          ),
          Text(_timeOfDay.format(context))
        ],
      );
  }

    //buildColorField()
  Widget buildColorField(BuildContext context) {
      //1
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //2
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
                style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        //3
        TextButton(
            child: const Text('Select'),
          onPressed: () {
              //4
            showDialog(
                context: context,
                builder: (context) {
                  //5
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      //6
                      onColorChanged: (color) {
                        setState(() => _currentColor = color);
                      },
                    ),
                    actions: [
                      //7
                      TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                        Navigator.of(context).pop();
                      },
                      ),
                    ],
                  );
                });
          } ,
        )
      ],
    );
  }

    //buildQuantityField()
  Widget buildQuantityField() {
      //1
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //2
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
                'Quantity',
               style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(width: 16.0),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        //3
        Slider(
          //4
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          //5
          value: _currentSliderValue.toDouble(),
          //6
          min: 0.0,
          max: 100.0,
          //7
          divisions: 100,
          //8
          label: _currentSliderValue.toInt().toString(),
          //9
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value.toInt();
            });
          },
        ),
      ],
    );
   }
  }