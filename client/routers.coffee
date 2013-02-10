
class OutfitterRouter extends Backbone.Router
    routes:
        "wardrobe": "main"
        "outfit/:outfit_id": "outfit"

    main: ->
        Session.set('outfit_id', null)

    outfit: (outfit_id)->
        Session.set('outfit_id', outfit_id)