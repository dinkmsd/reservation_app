import 'package:flutter/material.dart';

class NormalTextField extends StatefulWidget {
  const NormalTextField(
      {Key? key, this.validate, this.onChanged, this.controller, this.hintText})
      : super(key: key);

  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? validate;
  final TextEditingController? controller;
  final String? hintText;

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 20, color: Colors.black54),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true),
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      validator: (value) {
        widget.validate?.call(value);
        return value;
      },
    );
  }
}
