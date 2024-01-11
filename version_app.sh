#!/bin/bash
set -e

sed -i s/+version/$GO_PIPELINE_LABEL/g ./app/views/layouts/_copyright.html.erb
