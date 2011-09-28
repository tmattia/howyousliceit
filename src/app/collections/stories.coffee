Story = require('models/story').Story

class exports.Stories extends Backbone.Collection
  model: Story

  initialize: ->
    @localStorage = new Store "stories"
