# Gitlab

## Push to gitlab registry

### Tag the image with the (address of the registry) / (project group) / (project name)  

docker tag prod-build gitlab.itsshared.net:8443/peter.grainger/lunch-and-learn

### Push the image to the gitlab registry

docker push gitlab.itsshared.net:8443/peter.grainger/lunch-and-learn