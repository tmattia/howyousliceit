Story = require('models/story').Story

homeTemplate = require('templates/home')

class exports.HomeView extends Backbone.View
  el: '#home-view'

  render: ->
    $(@el).html homeTemplate()
    $(@el).find('#storymap-app').append app.views.importStories.render().el
    $(@el).find('#storymap-app').append app.views.addStory.render().el
    $(@el).find('#storymap-app').append app.views.map.render().el
    @
