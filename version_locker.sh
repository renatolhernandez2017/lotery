#!/bin/bash
set -e

sed -- s/#DEPLOY_VERSION/$IMAGE_TAG/g Dockerrun.aws.json.template > Dockerrun.aws.json
