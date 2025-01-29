#! /bin/bash

SCRIPT_LOC=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
WORKSPACE_APIS=${SCRIPT_LOC}/szapis
WORKSPACE_PROXY=${SCRIPT_LOC}/szproxy
GO_BIN=/usr/local/go/bin/go

BUILD_APP_NAME=erp-mobile-be
BUILD_DATA_DIR=${SCRIPT_LOC}/data
BUILD_DIST_GO=${SCRIPT_LOC}/genproto
BUILD_DIST_JS=${SCRIPT_LOC}/web/erp-web/src/app/proto
BUILD_PACK="github.com/softz-org/erp-mobile-be/genproto"
BUILD_PUBLISH_DIR=/var/www/app/${BUILD_APP_NAME}
BUILD_DEV_BE_REPOSITORY=softz-org/erpz-be-aio:2024-latest
BUILD_DEV_FE_REPOSITORY=softz-org/erpz-fe-aio:2024-latest
BUILD_FUMA_BE_REPOSITORY=softz-org/erpz-be-fuma:uat-latest

__tab__="    "

Help()
{
  echo "$__tab__ -p $__tab__ Start build Protocol buffers."

  echo
}

PrintStartDate()
{
  local START_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  echo "Start: ${START_DATE}"
}

PrintStopDate()
{
  local STOP_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  echo "Stop: ${STOP_DATE}"
}

BuildProtobuf()
{
  PrintStartDate

  cd ${WORKSPACE_APIS} && \
  bazel build //... && \

  CleanProtobuf && \
  BuildGoApi  "bazel-bin/sz/api/api_go_proto_" \
              "api" && \
  BuildGo     "bazel-bin/sz/common/v1/enums/enums_go_proto_pb" \
              "common/v1/enums" && \
  BuildGo     "bazel-bin/sz/common/v1/resources/resources_go_proto_pb" \
              "common/v1/resources" && \
  BuildGo     "bazel-bin/sz/common/v1/services/services_go_proto_pb" \
              "common/v1/services" && \
  BuildGo     "bazel-bin/sz/hrm/v1/enums/enums_go_proto_pb" \
              "hrm/v1/enums" && \
  BuildGo     "bazel-bin/sz/hrm/v1/resources/resources_go_proto_pb" \
              "hrm/v1/resources" && \
  BuildGo     "bazel-bin/sz/hrm/v1/services/services_go_proto_pb" \
              "hrm/v1/services" && \
  BuildGo     "bazel-bin/sz/iam/v1/enums/enums_go_proto_pb" \
              "iam/v1/enums" && \
  BuildGo     "bazel-bin/sz/iam/v1/resources/resources_go_proto_pb" \
              "iam/v1/resources" && \
  BuildGo     "bazel-bin/sz/iam/v1/services/services_go_proto_pb" \
              "iam/v1/services" && \
  BuildGo     "bazel-bin/sz/pom/v1/enums/enums_go_proto_pb" \
              "pom/v1/enums" && \
  BuildGo     "bazel-bin/sz/pom/v1/resources/resources_go_proto_pb" \
              "pom/v1/resources" && \
  BuildGo     "bazel-bin/sz/pom/v1/services/services_go_proto_pb" \
              "pom/v1/services" && \
  BuildGo     "bazel-bin/sz/report/v1/resources/resources_go_proto_pb" \
              "report/v1/resources" && \
  BuildGo     "bazel-bin/sz/report/v1/services/services_go_proto_pb" \
              "report/v1/services" && \
  BuildJs     "bazel-bin/sz/api/api_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/common/v1/enums/enums_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/common/v1/resources/resources_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/common/v1/services/services_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/hrm/v1/enums/enums_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/hrm/v1/resources/resources_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/hrm/v1/services/services_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/iam/v1/enums/enums_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/iam/v1/resources/resources_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/iam/v1/services/services_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/pom/v1/enums/enums_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/pom/v1/resources/resources_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/pom/v1/services/services_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/report/v1/resources/resources_js_proto_pb" && \
  BuildJs     "bazel-bin/sz/report/v1/services/services_js_proto_pb" && \
  BuildJs     "bazel-bin/validate/validate_js_proto_pb" && \
  BuildJs     "bazel-bin/google/api/api_js_proto_pb" && \
  BuildJs     "bazel-bin/google/api/field_behavior_js_proto_pb" && \
  BuildJs     "bazel-bin/google/api/annotations_js_proto_pb" && \
  BuildJs     "bazel-bin/google/iam/admin/v1/admin_js_proto_pb" && \
  BuildJs     "bazel-bin/google/iam/v1/iam_js_proto_pb" && \
  BuildJs     "bazel-bin/google/longrunning/longrunning_js_proto_pb" && \
  BuildJs     "bazel-bin/google/rpc/status_js_proto_pb" && \
  BuildJs     "bazel-bin/google/type/expr_js_proto_pb" && \
  BuildJs     "bazel-bin/google/type/latlng_js_proto_pb" && \

  cp ${WORKSPACE_APIS}/bazel-bin/sz/service.descriptor ${BUILD_DATA_DIR}/envoy &&


  cd ${BUILD_DIST_GO} &&
  protoc-go-inject-tag -input="*/*/*/*.go"

  PrintStopDate
}

while getopts "pwbchf" option; do
  case $option in
    p)
      BuildProtobuf
      exit;;

    h)
      Help $0
      exit;;

    \?)
      echo "Invalid options"
      exit;;
  esac
done

Help $0