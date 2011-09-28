window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

Stories = require('collections/stories').Stories
MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView
AddStoryView = require('views/add_story_view').AddStoryView
ImportStoriesView = require('views/import_stories_view').ImportStoriesView
MapView = require('views/map_view').MapView

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.collections.stories = new Stories()

    app.routers.main = new MainRouter()

    app.views.home = new HomeView()
    app.views.addStory = new AddStoryView()
    app.views.importStories = new ImportStoriesView()
    app.views.map = new MapView()

    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''

  app.initialize()
  Backbone.history.start()
