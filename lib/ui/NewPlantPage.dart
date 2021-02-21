import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantingapp/app/colors.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/notifiers/user.dart';
import 'package:plantingapp/ui/SolidButton.dart';
import 'package:provider/provider.dart';

class NewPlantPage extends StatefulWidget {
  @override
  _NewPlantPageState createState() => _NewPlantPageState();
}

class _NewPlantPageState extends State<NewPlantPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'name': null, 
    'xPer': null, 
    'per': null,
    'xDur': null,
    'dur': null
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close, color: PlantingColors.darkGreen,), onPressed: () => Navigator.of(context).pop(),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Grow a Plant", style: Theme.of(context).textTheme.headline1,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 8.0),
                      child: Text("My plant will be named", style: Theme.of(context).textTheme.headline4,),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        onSaved: (newValue) {
                          formData['name'] = newValue;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 8.0),
                      child: Text("I will water my plant", style: Theme.of(context).textTheme.headline4,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          padding: EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) => int.tryParse(val) != null ? null : "Invalid Number",
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black12,
                                filled: true,
                              ),
                              onSaved: (newValue) {
                                formData['xPer'] = int.parse(newValue);
                              },
                            ),
                          ),
                        ),
                        Text("Times", style: Theme.of(context).textTheme.headline4,),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Every", style: Theme.of(context).textTheme.headline4,),
                          Container(
                            width: 120,
                            padding: EdgeInsets.only(left: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              child: DropdownButtonFormField<Duration>(
                                iconSize: 20,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black12,
                                  filled: true,
                                ),
                                onChanged: (newValue) {
                                  formData['per'] = newValue;
                                },
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Day"),
                                    value: Duration(days: 1),
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Week"),
                                    value: Duration(days: 7),
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Month"),
                                    value: Duration(days: 30),
                                  )
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("For", style: Theme.of(context).textTheme.headline4,),
                        Container(
                          width: 70,
                          padding: EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) => int.tryParse(val) != null ? null : "Invalid Number",
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black12,
                                filled: true,
                              ),
                              onSaved: (newValue) {
                                formData['xDur'] = int.parse(newValue);
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          padding: EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: DropdownButtonFormField<Duration>(
                              iconSize: 20,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black12,
                                filled: true,
                              ),
                              onChanged: (newValue) {
                                formData['dur'] = newValue;
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text("Days"),
                                  value: Duration(days: 1),
                                ),
                                DropdownMenuItem(
                                  child: Text("Weeks"),
                                  value: Duration(days: 7),
                                ),
                                DropdownMenuItem(
                                  child: Text("Months"),
                                  value: Duration(days: 30),
                                )
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: SolidButton(
                        "Save Plant",
                        width: MediaQuery.of(context).size.width - 100,
                        theme: SolidButtonTheme.green,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            _submitForm(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    Plant newPlant = Plant(
      formData["name"],
      "No ID Yet",
      frequencyCount: formData["xPer"],
      frequencyDuration: formData["per"],
      growDuration: Duration(days: (formData["dur"] as Duration).inDays * formData["xDur"]),
      user: Provider.of<AnonUserInfo>(context, listen: false).uid,
      waterLevel: 0.0,
      height: 0.0
    );
    await Provider.of<PlantNotifier>(context, listen: false).add(newPlant);
    Navigator.of(context).pushNamed("/home");
  }
}