BaseModel = require '../BaseModel'

class UserKeys extends BaseModel
  all: (userId, fn = null) =>
    @get "users/#{parseInt userId}/keys", (data) => fn data if fn

  addKey: (userId, title, key, fn = null) =>
    params =
      title: title
      key: key

    @post "users/#{userId}/keys", params, (err, data) -> fn(err, data) if fn

  delKey: (userId, keyId, fn = null) =>
    @delete "users/#{userId}/keys/#{keyId}", (err, result) -> fn(err, result) if fn

module.exports = (client) -> new UserKeys client
