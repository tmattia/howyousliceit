{Story} = require('models/story')
importStoriesTemplate = require('templates/import_stories')

class exports.ImportStoriesView extends Backbone.View
  id: 'import-stories'

  events:
    'click button': 'importStories'

  render: ->
    $(@el).html importStoriesTemplate()
    @

  importStories: (event) ->
    text = $(@el).find('textarea').val()
    stories = text.split '\n'
    _.each stories, (story) => @importStory story

  importStory: (storyText) ->
    parts = storyText.split '\t'
    story = app.collections.stories.create
      title: parts[0]
      user: parts[1]
      frequency: @translateFrequency parts[2]
      value: parts[3]
    console.log story

  translateFrequency: (frequencyText) ->
    {
      'Horária': 5
      'Diária': 4
      'Semanal': 3
      'Mensal': 2
      'Semestral': 1
    }[frequencyText]
