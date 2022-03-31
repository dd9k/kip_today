// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyInvitationDAO.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MyInvitationDAOMixin on DatabaseAccessor<Database> {
  $MyInvitationEntityTable get myInvitationEntity =>
      attachedDatabase.myInvitationEntity;
  Selectable<int> _invitationWithCount() {
    return customSelect('SELECT COUNT(*) FROM cip_today_my_invitation',
            variables: [], readsFrom: {myInvitationEntity})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }
}
