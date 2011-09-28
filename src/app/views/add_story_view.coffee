addStoryTemplate = require('templates/add_story')

class exports.AddStoryView extends Backbone.View
  id: 'add-story'

  events:
    'keypress #add-story-title': 'addStory'

  render: ->
    $(@el).html addStoryTemplate()
    @

  addStory: (event) ->
    return unless event.keyCode is $.ui.keyCode.ENTER
    app.collections.stories.create title: $('#add-story-title').val()
    $('#add-story-title').val ''
