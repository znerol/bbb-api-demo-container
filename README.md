BigBlueButton Demo Apps Container
=================================

A container file which allows to quickly spin up BigBlueButton demos as a
docker container without installing them onto a BBB server. This is especially
useful to quickly and safely smoke-test new instances.

Works with `podman` and `docker`. Use whatever fits best.

Usage
-----

```
podman build -t bbb-api-demo .
podman run -it --rm --publish 8080:8080 \
    --env BIGBLUEBUTTON_SALT="paste-your-bigbluebutton-secret-here" \
    --env BIGBLUEBUTTON_URL="https://bbb.example.com/bigbluebutton/" \
    --name bbb-api-demo bbb-api-demo
```

Open the HTML5 demo in your browser: http://localhost:8080/demo/demoHTML5.jsp
