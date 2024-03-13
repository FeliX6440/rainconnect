import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_right_card_model.dart';
export 'user_right_card_model.dart';

class UserRightCardWidget extends StatefulWidget {
  const UserRightCardWidget({
    super.key,
    required this.teamDoc,
    required this.userDoc,
  });

  final TeamsRecord? teamDoc;
  final UsersRecord? userDoc;

  @override
  State<UserRightCardWidget> createState() => _UserRightCardWidgetState();
}

class _UserRightCardWidgetState extends State<UserRightCardWidget> {
  late UserRightCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRightCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 8.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x32000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child: Image.network(
                  widget.userDoc!.photoUrl,
                  width: 36.0,
                  height: 36.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userDoc!.displayName,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.userDoc?.reference != widget.teamDoc?.creatorRef)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.teamDoc!.admins.contains(widget.userDoc?.reference)
                          ? 'Admin'
                          : 'User',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Switch.adaptive(
                      value: _model.switchValue ??= widget.teamDoc!.admins
                          .contains(widget.userDoc?.reference),
                      onChanged: (newValue) async {
                        setState(() => _model.switchValue = newValue);
                        if (newValue) {
                          await widget.teamDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'admins': FieldValue.arrayUnion(
                                    [widget.userDoc?.reference]),
                              },
                            ),
                          });

                          await widget.userDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'teams_admin': FieldValue.arrayUnion(
                                    [widget.teamDoc?.reference]),
                              },
                            ),
                          });
                        } else {
                          await widget.userDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'teams_admin': FieldValue.arrayRemove(
                                    [widget.teamDoc?.reference]),
                              },
                            ),
                          });

                          await widget.teamDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'admins': FieldValue.arrayRemove(
                                    [widget.userDoc?.reference]),
                              },
                            ),
                          });
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).accent1,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).alternate,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: 20.0,
                      borderWidth: 3.0,
                      buttonSize: 35.0,
                      icon: Icon(
                        Icons.person_remove,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Delete user'),
                                  content: Text(
                                      'Are you sure you want to remove ${widget.userDoc?.displayName}from the team'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await widget.userDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'teams_admin': FieldValue.arrayRemove(
                                    [widget.teamDoc?.reference]),
                                'team_requests_sent': FieldValue.arrayRemove(
                                    [widget.teamDoc?.reference]),
                                'team_refs': FieldValue.arrayRemove(
                                    [widget.teamDoc?.reference]),
                              },
                            ),
                          });

                          await widget.teamDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'members': FieldValue.arrayRemove(
                                    [widget.userDoc?.reference]),
                                'admins': FieldValue.arrayRemove(
                                    [widget.userDoc?.reference]),
                                'requests': FieldValue.arrayRemove(
                                    [widget.userDoc?.reference]),
                              },
                            ),
                          });
                        }
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
