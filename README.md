# ElasticSearch PubNub Quickstart

This is a QuickStart bundle to help people get started with
ElasticSearch global replication with PubNub.

Prerequisites:

1. Internet connectivity
1. JAVA_HOME and PATH are configured with JDK version 7 or higher

Overall process:

1. Request a trial key from PubNub: http://goo.gl/oJnTpv
1. Download ElasticSearch PubNub Quickstart bundle: 
1. Unzip into a local directory
1. Configure River or Changes plugin (see below)
1. Start ElasticSearch: ./bin/elasticsearch


# Configuring the Changes Plugin

* edit conf/elasticsearch.yml

```
pubnub:
  enabled:true
  publishKey: YOUR-PUBLISH-KEY
  subscribeKey: YOUR-SUBSCRIBE-KEY
  useSsl:true
  channel: elasticsearch_changes
```

* YOUR-PUBLISH-KEY should match your PubNub publish key
* YOUR-SUBSCRIBE-KEY should match your PubNub subscribe key


# Configuring the River Plugin

* start ElasticSearch
* run the following command using Curl

```
curl -v -v -XPUT 'localhost:10200/_river/pubnub_river/_meta' -d '{ 
        "type" : "pubnub",
        "pubnub" : {
            "publishKey"   : "demo",
            "subscribeKey" : "demo",
            "useSsl"       : "true",
            "channels"     : "es_bostonmeetup_chan"
        },
        "index" : {
            "bulk_size" : 100
        }
    }'
```

# Debugging PubNub Communications

The `scripts` directory contains two scripts you can use to publish or listen to PubNub.

Prerequisites:

* Install node.js from http://nodejs.org
* Install coffeescript using "npm install -g coffee-script"
* Install PubNub using "npm install -g pubnub"

Using pubnub_debug_listen.coffee:

* edit the script to contain your *subscribe* key
* run ```coffee pubnub_debug_listen.coffee CHANNEL_NAME```, where CHANNEL_NAME is your PubNub channel name (as above, 'elasticsearch_changes')

Using pubnub_debug_publish.coffee:

* edit the script to contain your *publish* key
* edit the script to reflect your document content, index, key and version
* run ```coffee pubnub_debug_listen.coffee CHANNEL_NAME```, where CHANNEL_NAME is your PubNub channel name (as above, 'elasticsearch_changes')
