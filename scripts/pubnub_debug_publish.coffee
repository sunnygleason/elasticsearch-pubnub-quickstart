pubnub = require("pubnub").init {
  publish_key: "demo"
  subscribe_key: "demo"
}

console.log "sending"

pubnub.publish {
  channel: "es_bostonmeetup_chan"
  message: {
    "action"  : "create"
    "index"   : "index1"
    "type"    : "entry"
    "id"      : "abc123"
    "version" : "1"
    "_source" : {
      "title" : "how sweet it is"
      "description" : "this is awesome"
    }
  }
  callback: ->
    console.log "done"
    process.exit()
}

