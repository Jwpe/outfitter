

Outfits = new Meteor.Collection("outfits")

Outfits.allow
    remove: (userId) -> userId


Meteor.methods

    #Creates a new outfit belonging to the user
    createOutfit: (kwargs) ->
        kwargs = kwargs or {}

        if not (typeof kwargs.name == "string" and kwargs.name.length)
            throw new Meteor.Error(400, "Missing outfit title!")

        console.log(@userId)
        console.log(kwargs.name)

        return Outfits.insert
            owner: @userId
            name: kwargs.name
