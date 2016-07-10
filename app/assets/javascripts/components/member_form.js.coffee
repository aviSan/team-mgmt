RD = React.DOM
@MemberForm = React.createClass
  getInitialState: ->
    name: ''
    email: ''
    designation: ''
    mobile: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.name && @state.email && @state.designation && @state.mobile
  handleSubmit: (e) ->
    e.preventDefault()
    $.post 'team_members', { team_member: @state }, (data) =>
      @props.handleNewMember data
      @setState @getInitialState()
    , 'JSON'


  render: ->
    RD.form
      className: 'form-horizontal'
      encType: 'multipart/form-data'
      onSubmit: @handleSubmit
      RD.div
        className: 'row'
        RD.div
          className: 'col-md-6'
          RD.div
            className: 'form-group'
            RD.input
              type: 'text'
              className: 'form-control'
              placeholder: 'Name'
              name: 'name'
              value: @state.name
              onChange: @handleChange
        RD.div
          className: 'col-md-6'
          RD.div
            className: 'form-group'
            RD.input
              type: 'email'
              className: 'form-control'
              placeholder: 'Email'
              name: 'email'
              value: @state.email
              onChange: @handleChange
      RD.div
        className: 'row'
        RD.div
          className: 'col-md-6'
          RD.div
            className: 'form-group'
            RD.input
              type: 'number'
              className: 'form-control'
              placeholder: 'Mobile Number'
              name: 'mobile'
              value: @state.mobile
              onChange: @handleChange
        RD.div
          className: 'col-md-6'
          RD.div
            className: 'form-group'
            RD.input
              type: 'text'
              className: 'form-control'
              placeholder: 'Designation'
              name: 'designation'
              value: @state.designation
              onChange: @handleChange
      RD.button
        type: 'submit'
        className: 'btn btn-primary pull-right'
        disabled: !@valid()
        'Add Member'
