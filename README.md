# HomebridgeWebSwitch

A simple Web based switch for HomeBridge, use plugin: https://github.com/benzman81/homebridge-http-webhooks

It currently only has a single and at /api/tv which is an "Outlet".  This endpoint is for sending
CEC on / off commands to a TV.

example Homebridge config:

```json
"platforms": [
  "platform": "HttpWebHooks",
  "webhook_port": "51828",
  "cache_directory": "/homebridge/node-persist/storage",
  "outlets": [
      {
          "id": "tv1",
          "name": "TV",
          "rejectUnauthorized": false,
          "on_url": "http://homebridge:4000/api/tv",
          "on_method": "POST",
          "on_body": "{ \"on\" : true }",
          "on_headers": "{\"Authorization\": \"Bearer ABCDEFGH\", \"Content-Type\": \"application/json\"}",
          "off_url": "http://homebridge:4000/api/tv",
          "off_method": "POST",
          "off_body": "{ \"on\": false }",
          "off_headers": "{\"Authorization\": \"Bearer ABCDEFGH\", \"Content-Type\": \"application/json\"}"
      }
  ]
]
```
