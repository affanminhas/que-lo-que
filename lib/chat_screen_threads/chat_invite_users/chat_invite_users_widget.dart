import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_screen_threads/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'chat_invite_users_model.dart';
export 'chat_invite_users_model.dart';

class ChatInviteUsersWidget extends StatefulWidget {
  const ChatInviteUsersWidget({
    super.key,
    this.chatRef,
    this.chats,
  });

  final ChatsRecord? chatRef;
  final List<ChatsRecord>? chats;

  @override
  State<ChatInviteUsersWidget> createState() => _ChatInviteUsersWidgetState();
}

class _ChatInviteUsersWidgetState extends State<ChatInviteUsersWidget> {
  late ChatInviteUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatInviteUsersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.chatRef != null) {
        // addChatUsers_ToList
        _model.friendsList =
            widget.chatRef!.users.toList().cast<DocumentReference>();
        safeSetState(() {});
      } else {
        // addUser_ToList
        _model.addToFriendsList(currentUserReference!);
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 150.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).tertiary
                  ],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      FFLocalizations.of(context).getText(
                        '5bc7s2mf' /* Invite Friends */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4l8ygd8w' /* Select users from below to sta... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          UsersRecord>(
                        pagingController: _model.setListViewController(
                          UsersRecord.collection.orderBy('display_name'),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          160.0,
                        ),
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) =>
                              EmptyStateSimpleWidget(
                            icon: Icon(
                              Icons.groups_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 90.0,
                            ),
                            title: 'No Friends',
                            body: 'No users exist to create a chat with.',
                          ),
                          itemBuilder: (context, _, listViewIndex) {
                            final listViewUsersRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return Visibility(
                              visible: (listViewUsersRecord.reference !=
                                      currentUserReference) &&
                                  !(currentUserDocument?.chattingWith
                                              .toList() ??
                                          [])
                                      .contains(listViewUsersRecord.reference),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      // newChat

                                      var chatsRecordReference =
                                          ChatsRecord.collection.doc();
                                      await chatsRecordReference.set({
                                        ...createChatsRecordData(
                                          userA: currentUserReference,
                                          userB: listViewUsersRecord.reference,
                                          lastMessage: '',
                                          lastMessageTime: getCurrentTimestamp,
                                          lastMessageSentBy:
                                              currentUserReference,
                                          groupChatId: random_data
                                              .randomInteger(1000000, 9999999),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': functions.getRefList(
                                                currentUserReference!,
                                                listViewUsersRecord.reference),
                                          },
                                        ),
                                      });
                                      _model.chatThread =
                                          ChatsRecord.getDocumentFromData({
                                        ...createChatsRecordData(
                                          userA: currentUserReference,
                                          userB: listViewUsersRecord.reference,
                                          lastMessage: '',
                                          lastMessageTime: getCurrentTimestamp,
                                          lastMessageSentBy:
                                              currentUserReference,
                                          groupChatId: random_data
                                              .randomInteger(1000000, 9999999),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': functions.getRefList(
                                                currentUserReference!,
                                                listViewUsersRecord.reference),
                                          },
                                        ),
                                      }, chatsRecordReference);

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'chattingWith':
                                                FieldValue.arrayUnion([
                                              listViewUsersRecord.reference
                                            ]),
                                          },
                                        ),
                                      });
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'ChatDetailView',
                                        queryParameters: {
                                          'chatRef': serializeParam(
                                            _model.chatThread,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatRef': _model.chatThread,
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: _model.friendsList.contains(
                                                listViewUsersRecord.reference)
                                            ? FlutterFlowTheme.of(context)
                                                .accent1
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: _model.friendsList.contains(
                                                  listViewUsersRecord.reference)
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewUsersRecord
                                                          .photoUrl,
                                                      'https://firebasestorage.googleapis.com/v0/b/que-lo-que-2-05vr7v.firebasestorage.app/o/AppAssets%2Fuser_default%20(1).png?alt=media&token=402ca7ea-8208-43ce-abaa-7a0af96c367e',
                                                    ),
                                                  ).image,
                                                ),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewUsersRecord
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewUsersRecord.email,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.chat,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
