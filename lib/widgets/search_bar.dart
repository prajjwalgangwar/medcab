import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onClear;
  final double height;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;

  const MSearchBar(
      {Key? key,
      this.onChanged,
      this.onClear,
      this.hintText = 'Search manpower etc... ',
      this.height = 50,
      required this.controller,
      this.inputFormatters})
      : super(key: key);

  @override
  State<MSearchBar> createState() => _MSearchBarState();
}

class _MSearchBarState extends State<MSearchBar> {
  @override
  Widget build(BuildContext context) {
    print('building search bar');
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: AnimatedContainer(
          height: widget.height,
          duration: const Duration(microseconds: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.grey.shade500),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  cursorColor: Colors.black,
                  showCursor: true,
                  onChanged: widget.onChanged,
                  inputFormatters: widget.inputFormatters,
                  style: GoogleFonts.poppins(fontSize: 12),
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      labelStyle: GoogleFonts.poppins(fontSize: 12),
                      hintStyle: GoogleFonts.poppins(fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
