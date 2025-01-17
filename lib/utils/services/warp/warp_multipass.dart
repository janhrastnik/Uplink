// ignore_for_file: lines_longer_than_80_chars

import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/multipass.dart' as multipass;
import 'package:warp_dart/warp.dart';

class WarpMultipass {
  final _warpBloc = GetIt.I.get<WarpBloc>();

  Future<String> createUser({
    required String username,
    required String messageStatus,
    required String passphrase,
    required String base64Image,
  }) async {
    try {
      final _currentUserDID =
          _warpBloc.multipass?.createIdentity(username.trim(), passphrase);
      changeMessageStatus(messageStatus);
      changeProfilePicture(base64Image);
      return _transformDIDtoString(_currentUserDID!);
    } catch (error) {
      throw Exception(error);
    }
  }

  Map<String, dynamic> getCurrentUserInfo() {
    try {
      final _currentUserIdentity = _warpBloc.multipass!.getOwnIdentity();
      final _currentUserMap = {
        'did': _transformDIDtoString(_currentUserIdentity.did_key),
        'username': _currentUserIdentity.username,
        'status_message': _currentUserIdentity.status_message,
        'profile_picture': _currentUserIdentity.graphics.profile_picture,
        'banner_picture': _currentUserIdentity.graphics.profile_banner,
      };

      return _currentUserMap;
    } catch (error) {
      throw Exception(error);
    }
  }

  String getDid() {
    try {
      final _did = _warpBloc.multipass!.getOwnIdentity().did_key;
      return _transformDIDtoString(_did);
    } catch (error) {
      throw Exception(error);
    }
  }

  String getUsername() {
    try {
      final _username = _warpBloc.multipass!.getOwnIdentity().username;
      return _username;
    } catch (error) {
      throw Exception(error);
    }
  }

  String getMessageStatus() {
    try {
      return _warpBloc.multipass!.getOwnIdentity().status_message!;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeUsername(String newUserName) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setUsername(newUserName.trim());
      _warpBloc.multipass!.updateIdentity(_identityUpdated);
      return getUsername();
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeMessageStatus(String newStatus) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setStatusMessage(newStatus.trim());

      _warpBloc.multipass!.updateIdentity(_identityUpdated);
      return getMessageStatus();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getProfilePicture() {
    try {
      final _profilePictureBase64String =
          _warpBloc.multipass!.getOwnIdentity().graphics.profile_picture;
      return _profilePictureBase64String;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeProfilePicture(String _base64Image) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setPicture(_base64Image);
      _warpBloc.multipass!.updateIdentity(_identityUpdated);
      return getProfilePicture();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getBannerPicture() {
    try {
      final _bannerPictureBase64String =
          _warpBloc.multipass!.getOwnIdentity().graphics.profile_banner;
      return _bannerPictureBase64String;
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'get_banner_picture',
        error.error_type,
        error.error_message,
      ]);
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeBannerPicture(String _base64Image) {
    try {
      final _identityUpdated = multipass.IdentityUpdate.setBanner(_base64Image);
      _warpBloc.multipass!.updateIdentity(_identityUpdated);
      return getBannerPicture();
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'change_banner_picture',
        error.error_type,
        error.error_message,
      ]);
    } catch (error) {
      throw Exception(error);
    }
  }

  Map<String, dynamic>? findUserByDid(String _userDid) {
    try {
      final _userIdentity = _warpBloc.multipass!.getIdentityByDID(
        _returnCompleteDID(_userDid).toString(),
      );

      final _userMap = {
        'did': _userIdentity.did_key.toString().replaceAll('did:key:', ''),
        'username': _userIdentity.username,
        'status_message': _userIdentity.status_message,
        'profile_picture': _userIdentity.graphics.profile_picture,
        'banner_picture': _userIdentity.graphics.profile_banner,
      };
      return _userMap;
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'find_user_by_did',
        error.error_type,
        error.error_message
      ]);
    } catch (error) {
      if (error.toString().contains('Identity not found')) {
        return null;
      }

      throw Exception(['find_user_by_did', error]);
    }
  }

  void sendFriendRequest(String _userDID) {
    try {
      _warpBloc.multipass!.sendFriendRequest(
        _returnCompleteDID(_userDID),
      );
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'send_friend_request',
        error.error_type,
        error.error_message
      ]);
    } catch (error) {
      throw Exception(['send_friend_request', error]);
    }
  }

  List<Map<String, dynamic>> listIncomingFriendRequests() {
    try {
      final _incomingRequestList = <Map<String, dynamic>>[];
      final _incomingRequests = _warpBloc.multipass!.listIncomingRequest();

      for (final friendRequest in _incomingRequests) {
        final _userMap =
            findUserByDid(_transformDIDtoString(friendRequest.from));

        if (_userMap != null) {
          final _friendRequestMap = {
            'user': _userMap,
            'status': friendRequest.status.name,
          };
          _incomingRequestList.add(
            _friendRequestMap,
          );
        }
      }
      return _incomingRequestList;
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'list_incmoing_friend_request',
        error.error_type,
        error.error_message
      ]);
    } catch (error) {
      throw Exception(['list_incoming_friend_request', error]);
    }
  }

  List<Map<String, dynamic>> listOutgoingFriendRequests() {
    try {
      final _outgoingRequestList = <Map<String, dynamic>>[];
      final _outgoingRequests = _warpBloc.multipass!.listOutgoingRequest();

      for (final friendRequest in _outgoingRequests) {
        final _userMap = findUserByDid(_transformDIDtoString(friendRequest.to));

        if (_userMap != null) {
          final _friendRequestMap = {
            'user': _userMap,
            'status': friendRequest.status.name,
          };
          _outgoingRequestList.add(
            _friendRequestMap,
          );
        }
      }
      return _outgoingRequestList;
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'list_outgoing_friend_request',
        error.error_type,
        error.error_message
      ]);
    } catch (error) {
      throw Exception(['list_outgoing_friend_request', error]);
    }
  }

  List<Map<String, dynamic>> listFriends() {
    try {
      final _friendsList = <Map<String, dynamic>>[];
      final _friends = _warpBloc.multipass!.listFriends();
      for (final friend in _friends) {
        final _userMap = findUserByDid(_transformDIDtoString(friend));

        if (_userMap != null) {
          _friendsList.add(
            _userMap,
          );
        }
      }
      return _friendsList;
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'list_friends',
        error.error_type,
        error.error_message
      ]);
    } catch (error) {
      throw Exception(['list_friends', error]);
    }
  }

  void acceptFriendRequest(String userDID) {
    try {
      _warpBloc.multipass!.acceptFriendRequest(_returnCompleteDID(userDID));
    } catch (error) {
      throw Exception(['accept_friend_request', error]);
    }
  }

  void denyFriendRequest(String userDID) {
    try {
      _warpBloc.multipass!.denyFriendRequest(_returnCompleteDID(userDID));
    } on WarpException catch (error) {
      if (error.error_message == 'Cannot find friend request') {
        return;
      }
    } catch (error) {
      throw Exception(['deny_friend_request', error]);
    }
  }

  void cancelFriendRequestSent(String userDID) {
    try {
      _warpBloc.multipass!.closeFriendRequest(_returnCompleteDID(userDID));
    } catch (error) {
      throw Exception(['cancel_friend_request_sent', error]);
    }
  }
}

DID _returnCompleteDID(String _userDID) => DID.fromString('did:key:$_userDID');

String _transformDIDtoString(DID did) =>
    did.toString().replaceAll('did:key:', '');
