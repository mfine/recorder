# Recorder Service

## Shipper Script

There's a script to ship a log to the recorder service here at
[shipper.rb](https://github.com/mfine/recorder/blob/master/scripts/shipper.rb).

## Sample Usage

### Create a Device

```
$ curl -i -X POST -H "Content-Type: application/json" https://sbp-recorder.herokuapp.com/devices
HTTP/1.1 201 Created
Date: Thu, 05 Mar 2015 02:24:36 GMT

{"uuid":"b9fda561-fc4c-4772-9c6e-75df4b4f8fe1","created_at":"2015-03-05 02:24:36 +0000","updated_at":null}
```

### Create a Record

```
$ curl -i -X POST -d '{"foo":"bar"}' -H "Content-Type: application/json" https://sbp-recorder.herokuapp.com/devices/b9fda561-fc4c-4772-9c6e-75df4b4f8fe1/records
HTTP/1.1 201 Created
Date: Thu, 05 Mar 2015 02:26:53 GMT

{"uuid":"6e9854ba-7243-4326-993d-c469e29855ed","created_at":"2015-03-05 02:26:54 +0000","updated_at":null,"device_id":"b9fda561-fc4c-4772-9c6e-75df4b4f8fe1","data":{"foo":"bar"},"txid":126802181}
```

### Get Records

```
$ curl -i -X GET -H "Content-Type: application/json" https://sbp-recorder.herokuapp.com/devices/b9fda561-fc4c-4772-9c6e-75df4b4f8fe1/records
HTTP/1.1 200 OK
Date: Thu, 05 Mar 2015 02:28:29 GMT

{"6e9854ba-7243-4326-993d-c469e29855ed":{"uuid":"6e9854ba-7243-4326-993d-c469e29855ed","created_at":"2015-03-05 02:26:54 +0000","updated_at":null,"device_id":"b9fda561-fc4c-4772-9c6e-75df4b4f8fe1","data":{"foo":"bar"},"txid":126802181}}
```

### Get Records via a Stream

```
$ curl -i -X GET -H "Content-Type: application/json" https://sbp-recorder.herokuapp.com/devices/b9fda561-fc4c-4772-9c6e-75df4b4f8fe1/records?chunked=true
HTTP/1.1 202 Accepted
Date: Thu, 05 Mar 2015 02:29:27 GMT

{"uuid":"6e9854ba-7243-4326-993d-c469e29855ed","created_at":"2015-03-05 02:26:54 +0000","updated_at":null,"device_id":"b9fda561-fc4c-4772-9c6e-75df4b4f8fe1","data":{"foo":"bar"},"txid":126802181}

...
```
