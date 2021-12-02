Docker tag Drone Plugin
-----------------------

This [Drone Plugin](https://docs.drone.io/plugins/overview/) allows you to add a
new tag to an already-published Docker image. The image might for example have
been built and published using the
[Docker plugin](https://docs.drone.io/plugins/popular/docker/) under a version
tag, and you'd like to add a new tag to that version.

Usage
-----

The following settings are expected:
- `username` and `password` are used by `docker login` to log you into the
  registry;
- `repo` is the URL for your repository
- `source_tag` is the original tag (must already be present)
- `target_tag` is the new tag (should not be present)

The plugin will log into the registry, pull the existing image with the source
tag, and it push back onto the registry with the target tag.

```
steps:
- name: tag-and-push:myapp
  image: stephanealnet/docker-tag
  settings:
    repo: acme/myapp
    source_tag: 'v1.2.3'
    target_tag: 'prod'
    username:
      from_secret: registry_user
    password:
      from_secret: registry_password
```
