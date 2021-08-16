import 'package:flutter/material.dart';
import 'package:staffer/bloc/assignment_bloc/assignment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Active extends StatefulWidget {
  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  AssignmentBloc assignmentBloc;
  @override
  void initState() {
    super.initState();
    print(context);
    assignmentBloc = BlocProvider.of<AssignmentBloc>(context);
    // assignmentBloc.add(FetchAssignmentEvent());
  }

  bool _reverseSort = false;
  final List<String> _items = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').toList();

  // Handler called by ReorderableListView onReorder after a list child is
  // dropped into a new position.
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = _items.removeAt(oldIndex);
      _items.insert(newIdx, item);
    });
  }

  // Handler called when the "sort" button on appbar is clicked.
  void _onSort() {
    setState(() {
      _reverseSort = !_reverseSort;
      _items.sort((a, b) => _reverseSort ? b.compareTo(a) : a.compareTo(b));
    });
  }

  @override
  Widget build(BuildContext context) {
    // void initState() {
    //   // BlocProvider.of<AssignmentBloc>(context).add(
    //   //   FetchAssignmentEvent(),
    //   // );
    //   print('----------here');
    // }

    final _appbar = AppBar(
      title: const Text('Reorderable list'),
      backgroundColor: Color(0xff5808e5),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.sort_by_alpha),
          tooltip: 'Sort',
          onPressed: _onSort,
        ),
      ],
    );
    return Scaffold(
      appBar: _appbar,
      body: ReorderableListView(
        onReorder: _onReorder,
        children: [
          for (final item in _items)
            ListTile(
                key: Key(item),
                title: Text('item $item'),
                subtitle: const Text('The airplane is  only in Act II.'),
                contentPadding: EdgeInsets.all(10),
                onTap: () => print("ListTile"))
        ],
      ),
    );
  }
}
