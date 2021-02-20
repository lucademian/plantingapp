import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Map<String, dynamic> formData = {'name': null, 'password': null};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Create a Plant", style: Theme.of(context).textTheme.headline1,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Plant Name'),
                onSaved: (newValue) {
                  formData['name'] = newValue;
                },
              ),
              SolidButton(
                "Save Plant",
                theme: SolidButtonTheme.green,
                onPressed: () {
                  _formKey.currentState.save();
                  _submitForm(context);
                },
              ),
            ],
          ),
          
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    Plant newPlant = Plant(
      formData["name"],
      "No ID Yet",
      user: Provider.of<AnonUserInfo>(context, listen: false).uid,
      waterLevel: 0.0,
      height: 0.0
    );
    await Provider.of<PlantsModel>(context, listen: false).add(newPlant);
    Navigator.of(context).pushNamed("/home");
  }
}