 RD = React.DOM
 @Members = React.createClass
  getInitialState: ->
    members: @props.data
  getDefaultProps: ->
    members: []
  addMember: (member) ->
    members = React.addons.update(@state.members, { $push: [member] })
    @setState members: members
  deleteMember: (member) ->
    index = @state.members.indexOf member
    members = React.addons.update(@state.members, { $splice: [[index, 1]] })
    @replaceState members: members
  updateMember: (member, data) ->
    index = @state.members.indexOf member
    members = React.addons.update(@state.members, { $splice: [[index, 1, data]] })
    @replaceState members: members
  render: ->
    RD.div
      className: 'members'
      RD.h2
        className: 'title'
        'Team Members'
      React.createElement MemberForm, handleNewMember: @addMember
      RD.hr null
      RD.table
        className: 'table table-bordered table-striped'
        RD.thead
          className: 'thead-inverse'
          RD.tr null,
            RD.th null, 'Name'
            RD.th null, 'Email'
            RD.th null, 'Designation'
            RD.th null, 'Mobile'
            RD.th null, 'Actions'
        RD.tbody null,
          for member in @state.members
            React.createElement Member, key: member.id, member: member, handleDeleteMember: @deleteMember, handleEditMember: @updateMember
