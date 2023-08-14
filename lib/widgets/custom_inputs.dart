import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestor_ingresos/lang/generated/l10n.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final void Function(String)? onChange;
  final bool isRequired;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  const CustomInput(
    this.label, {
    Key? key,
    this.onChange,
    this.isRequired = true,
    this.keyboardType,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(label: Text(label)),
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) return AppLang.of(context).requiredForm;
              return null;
            }
          : null,
      onChanged: onChange,
    );
  }
}

class EmailField extends StatelessWidget {
  final String title;
  final void Function(String)? onChange;
  const EmailField(
    this.title, {
    super.key,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: title),
      autofillHints: const [AutofillHints.email],
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) return AppLang.of(context).requiredForm;
        return null;
      },
    );
  }
}

class PasswordField extends StatefulWidget {
  final String title;
  final void Function(String)? onChange;

  const PasswordField(
    this.title, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        labelText: widget.title,
        suffixIcon: IconButton(
          icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return AppLang.of(context).requiredForm;
        return null;
      },
      autofillHints: const [AutofillHints.password],
      onChanged: widget.onChange,
      onEditingComplete: () => TextInput.finishAutofillContext(),
    );
  }
}
