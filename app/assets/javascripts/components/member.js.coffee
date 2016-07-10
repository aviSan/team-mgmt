@Member = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: ReactDOM.findDOMNode(@refs.name).value
      email: ReactDOM.findDOMNode(@refs.email).value
      designation: ReactDOM.findDOMNode(@refs.designation).value
      mobile: ReactDOM.findDOMNode(@refs.mobile).value
    $.ajax
      method: 'PUT'
      url: "/team_members/#{ @props.member.id }"
      dataType: 'JSON'
      data:
        team_member: data
      success: (data) =>
        @setState edit: false
        @props.handleEditMember @props.member, data

  handleDelete: (e) ->
    e.preventDefault()
    if confirm('Are you sure to remove this member?') == true
      $.ajax
        method: 'DELETE'
        url: "/team_members/#{ @props.member.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteMember @props.member

  render: ->
    if @state.edit
      @memberForm()
    else
      @memberRow()

  memberRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.member.name
      React.DOM.td null, @props.member.email
      React.DOM.td null, @props.member.designation
      React.DOM.td null, @props.member.mobile
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-secondary'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Remove'

  memberForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.member.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'email'
          defaultValue: @props.member.email
          ref: 'email'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.member.designation
          ref: 'designation'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.member.mobile
          ref: 'mobile'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-secondary'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
