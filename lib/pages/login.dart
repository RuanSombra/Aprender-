import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_module_c_project/styles/styles.dart';
import 'package:sp_module_c_project/widgets/toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List inputs = [
    {'controller': TextEditingController(), 'focus': FocusNode()},
    {'controller': TextEditingController(), 'focus': FocusNode()},
    {'controller': TextEditingController(), 'focus': FocusNode()},
    {'controller': TextEditingController(), 'focus': FocusNode()},
  ];

  Color cor = Colors.black;
  var formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState!.validate()) {
      String pin = '';
      for (var input in inputs) {
        pin += input['controller'].text;
      }

      if (pin == "3245") {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        MyToast.get('Pin incorreto');

        for (var input in inputs) {
          input['controller'].clear();
        }

        cor = Colors.red;
        setState(() {});
        await Future.delayed(Duration(seconds: 2));
        setState(() {});
        cor = Colors.black;
      }
    } else {
      MyToast.get('Todos os campos são obrigatórios');
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(inputs.first['focus']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', scale: 8),
                SizedBox(height: 16),
                Text(
                  'Digite a senha de acesso',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var input in inputs)
                      SizedBox(
                        width: 56,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: input['controller'],
                          focusNode: input['focus'],
                          
                          style: TextStyle(color: cor),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: cor,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            } else if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: cor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: cor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: cor),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Cores.azulMedio,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text('Entrar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}