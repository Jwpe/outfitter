console.log("Starting router")

Router = new OutfitterRouter
Backbone.history.start({pushState: true})

#Checks if there is a current user
Template.main.user_id = ->
    return Meteor.userId()

#Gets the current outfit_id from the session when dashboard is displayed
Template.dashboard.outfit_id = ->
    return Session.get('outfit_id')

#Makes nav links use the Backbone router instead of reloading the page
Template.sidebar.events
    'click .outfitter-navlink': (event) ->
        event.preventDefault()
        #Just get the path from the <a> tag
        path = event.currentTarget.pathname
        Router.navigate(path, true)

#Returns a list of outfits for the sidebar
Template.sidebar.outfits = ->
    return Outfits.find()

#Returns the current outfit to the outfit view
Template.outfit.outfit = ->
    return Outfits.findOne({_id: Session.get('outfit_id')})
