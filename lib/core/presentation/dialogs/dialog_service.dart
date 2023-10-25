//======================================
// This will be used to show the dialog
// =====================================
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogService {
  Completer<DialogResponse>? _dialogCompleter;

  BuildContext? context;

  void registerContext(BuildContext context) {
    this.context = context;
  }

  //======================================
  // Show the confirmation box
  // =====================================

  Future<DialogResponse<bool?>> showConfirmation(DialogRequest request) {
    _dialogCompleter = Completer<DialogResponse<bool>>();
    if (context != null) {
      //======================================
      // dialog actions
      // =====================================
      List<Widget> actions = <Widget>[
        TextButton(
          child: Text(request.okButtonTitle!),
          onPressed: () {
            Navigator.of(context!).pop();
            dialogComplete<bool>(new DialogResponse<bool>(
                response: true, additionalNote: "Okay button clicked"));
          },
        ),
        TextButton(
          child: Text(request.cancelButtonTitle!),
          onPressed: () {
            Navigator.of(context!).pop();
            dialogComplete<bool>(new DialogResponse<bool>(
                response: false, additionalNote: "Cancel button clicked"));
          },
        ),
      ];
      //======================================
      // dialog content
      // =====================================
      Widget _content = SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(request.description!),
          ],
        ),
      );
      //======================================
      // dialog title
      // =====================================

      //dialogService.registerContext(context);
      Widget _title = Text(request.title!);
      showDialog<bool>(
          context: this.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Platform.isIOS
                ? CupertinoAlertDialog(
                    title: _title, content: _content, actions: actions)
                : AlertDialog(
                    title: _title, content: _content, actions: actions);
          });
    }
    return _dialogCompleter!.future as Future<DialogResponse<bool?>> ;
  }

  void dialogComplete<TKey>(DialogResponse<TKey> response) {
    _dialogCompleter!.complete(response);
    _dialogCompleter = null;
  }

  deregisterContext() {
    this.context = null;
  }
}

class DialogRequest {
  final String? title;
  final String? description;
  final String? okButtonTitle;
  final String? cancelButtonTitle;
  DialogRequest({
    this.cancelButtonTitle = "Cancel",
    this.title,
    this.description,
    this.okButtonTitle = "Okay",
  });
}

class DialogResponse<T> {
  final String? additionalNote;

  final T? response;

  DialogResponse({
    this.additionalNote,
    this.response,
  });
}
