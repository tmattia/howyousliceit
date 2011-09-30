StoryView = require('views/story_view').StoryView

class exports.MapView extends Backbone.View
  id: 'map-view'

  initialize: ->
    app.collections.stories.bind 'add', @addOne
    app.collections.stories.bind 'reset', @addAll

  addOne: (story) =>
    view = new StoryView model: story
    $(@el).append view.render().el
    $(view.el).draggable
      stop: =>
        story.save
          top: $(view.el).css 'top'
          left: $(view.el).css 'left'

  addAll: ->
    app.collections.stories.each app.views.map.addOne
