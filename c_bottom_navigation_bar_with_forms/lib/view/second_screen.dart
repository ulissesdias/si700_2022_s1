import 'package:c_bottom_navigation_bar_with_forms/model/complete_form.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
  final CompleteForm completeForm = CompleteForm();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            myCheckbox(),
            mySwitch(),
            mySlider(),
            myRadio(1),
            myRadio(2),
            myRadio(3),
            myRadio(4),
            const Divider(),
            myButtonSnackBar(),
            const Divider(),
            myButtonBottomSheet(),
          ],
        ));
  }

  Widget myCheckbox() {
    return Checkbox(
      value: completeForm.checkboxValue,
      onChanged: (bool? inValue) {
        if (inValue != null) {
          setState(() {
            completeForm.checkboxValue = inValue;
          });
        }
      },
    );
  }

  Widget mySwitch() {
    return Switch(
      value: completeForm.switchValue,
      onChanged: (bool inValue) {
        setState(() {
          completeForm.switchValue = inValue;
        });
      },
    );
  }

  Widget mySlider() {
    return Slider(
      min: 0,
      max: 20,
      value: completeForm.sliderValue,
      onChanged: (double inValue) {
        setState(() => completeForm.sliderValue = inValue);
      },
    );
  }

  Widget myRadio(int value) {
    return Radio(
      value: value, // Valor deste botão
      groupValue: completeForm.radioValue, // Valor do grupo
      onChanged: (int? inValue) {
        if (inValue != null) {
          setState(() {
            completeForm.radioValue = inValue;
          });
        }
      },
    );
  }

  Widget myButtonSnackBar() {
    return ElevatedButton(
      child: const Text("Mostrar SnackBar!"),
      onPressed: () {
        completeForm.doSomething();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
            content: const Text("Obrigado"),
            action: SnackBarAction(
                label: "Volte Sempre! ${completeForm.radioValue}",
                onPressed: () {})));
      },
    );
  }

  Widget myButtonBottomSheet() {
    return ElevatedButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            backgroundColor: Colors.green,
            builder: (_) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Quem é o seu professor favorito:"),
                        TextButton(
                            child: const Text("Guilherme Coelho"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: const Text("Celmar Guimarães"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: const Text("Ulisses Martins Dias"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  )
                ],
              );
            },
          );
        },
        child: const Text("Vote no Professor Favorito"));
  }
}
