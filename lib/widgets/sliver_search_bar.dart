import 'package:coronatracker/data/sorting.dart';
import 'package:flutter/material.dart';

class SliverSearchBar extends StatelessWidget {
  final String _hintText;
  final bool _enabled;
  final TextEditingController _controller;
  final Widget _trailingIcon;
  final VoidCallback _onTap;
  final ValueChanged<String> _onChanged;
  final ValueChanged<String> _onSubmitted;

  const SliverSearchBar({
    @required String hintText,
    @required bool enabled,
    @required TextEditingController controller,
    @required Widget trailingIcon,
    @required VoidCallback onTap,
    @required ValueChanged<String> onChanged,
    @required ValueChanged<String> onSubmitted,
  })  : this._hintText = hintText,
        this._enabled = enabled,
        this._controller = controller,
        this._trailingIcon = trailingIcon,
        this._onTap = onTap,
        this._onChanged = onChanged,
        this._onSubmitted = onSubmitted,
        assert(hintText != null),
        assert(enabled != null),
        assert(controller != null),
        assert(trailingIcon != null),
        assert(onTap != null),
        assert(onChanged != null),
        assert(onSubmitted != null);

  @override
  Widget build(BuildContext context) {
    Widget textField = TextField(
      autofocus: _enabled,
      focusNode: FocusNode(canRequestFocus: true),
      controller: _controller,
      enabled: _enabled,
      onChanged: _onChanged,
      onSubmitted: _onSubmitted,
      decoration: InputDecoration(
        hintText: _hintText,
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverAppBar(
        backgroundColor: Colors.grey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        floating: true,
        pinned: true,
        key: GlobalKey(debugLabel: "sliver_search_bar"),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        leading: Icon(Icons.search),
        actions: [_trailingIcon],
        title: GestureDetector(
          onTap: _onTap,
          child: textField,
        ),
      ),
    );
  }
}
