import 'package:flutter/material.dart';
import './product.dart';
import 'package:provider/provider.dart';
import './products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _gender = TextEditingController();

  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    name: '',
    password: '',
    email: '',
  );

  @override
  void dispose() {
    _name.dispose();
    _password.dispose();
    _gender.dispose();
    super.dispose();  
  }

  _saveForm() {
    _form.currentState.save();
    print(_editedProduct.name);
    print(_editedProduct.password);
    print(_editedProduct.email);
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your name",
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                controller: _name,
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedProduct = Product(
                    name: value,
                    password: _editedProduct.password,
                    email: _editedProduct.email,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your passowrd",
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                controller: _password,
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedProduct = Product(
                    name: _editedProduct.name,
                    password: value,
                    email: _editedProduct.email,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your Gender",
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                controller: _gender,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _saveForm(),
                onSaved: (value) {
                  _editedProduct = Product(
                    name: _editedProduct.name,
                    password: _editedProduct.password,
                    email: value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
