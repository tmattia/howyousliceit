storyTemplate = require('templates/story')

class exports.StoryView extends Backbone.View
  className: 'story'

  events:
    'dblclick': 'edit'
    'keypress input': 'save'
    'click .remove': 'remove'

  initialize: ->
    @model.bind 'change', @render

  render: =>
    $(@el).html(storyTemplate(story: @model.toJSON()))
    $(@el).css
      top: @model.get 'top'
      left: @model.get 'left'
    frequency = @model.get 'frequency'
    value = @model.get 'value'
    $(@el).find('.frequency .highest').addClass 'checked' if frequency >= 5
    $(@el).find('.frequency .high').addClass 'checked' if frequency >= 4
    $(@el).find('.frequency .medium').addClass 'checked' if frequency >= 3
    $(@el).find('.frequency .low').addClass 'checked' if frequency >= 2
    $(@el).find('.frequency .lowest').addClass 'checked' if frequency >= 1
    $(@el).find('.value .high').addClass 'checked' if value >= 3
    $(@el).find('.value .medium').addClass 'checked' if value >= 2
    $(@el).find('.value .low').addClass 'checked' if value >= 1
    @

  edit: (event) =>
    $(@el).addClass 'editing'
    $(@el).find('input.title').focus()

  save: (event) =>
    return unless event.keyCode is $.ui.keyCode.ENTER
    @model.save
      title: $(@el).find('input.title').val()
      user: $(@el).find('input.user').val()
    $(@el).removeClass 'editing'

  remove: (event) =>
    @model.destroy()
    $(@el).remove()
