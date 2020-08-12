import 'package:coronatracker/data/sorting.dart';
import 'package:flutter/material.dart';

class SliverSearchBar extends StatelessWidget {
  final String _hintText;
  final bool _enabled;
  final TextEditingController _controller;
  final Widget _suffixIcon;
  final VoidCallback _onTap;
  final ValueChanged<String> _onChanged;
  final ValueChanged<String> _onSubmitted;

  const SliverSearchBar({
    @required String hintText,
    @required bool enabled,
    @required TextEditingController controller,
    @required Widget suffixIcon,
    @required VoidCallback onTap,
    @required ValueChanged<String> onChanged,
    @required ValueChanged<String> onSubmitted,
  })  : this._hintText = hintText,
        this._enabled = enabled,
        this._controller = controller,
        this._suffixIcon = suffixIcon,
        this._onTap = onTap,
        this._onChanged = onChanged,
        this._onSubmitted = onSubmitted,
        assert(hintText != null),
        assert(enabled != null),
        assert(controller != null),
        assert(suffixIcon != null),
        assert(onTap != null),
        assert(onChanged != null),
        assert(onSubmitted != null);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        floating: true,
        pinned: true,
        flexibleSpace: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 75.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: TextField(
              controller: _controller,
              enabled: _enabled,
              onTap: _onTap,
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
              decoration: InputDecoration(
                hintText: _hintText,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14.0),
                icon: Icon(Icons.search),
                suffixIcon: _suffixIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
