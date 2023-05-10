#!/bin/sh
set -e
set -u
set -o pipefail

function on_error {
  echo "$(realpath -mq "${0}"):$1: error: Unexpected failure"
}
trap 'on_error $LINENO' ERR


# This protects against multiple targets copying the same framework dependency at the same time. The solution
# was originally proposed here: https://lists.samba.org/archive/rsync/2008-February/020158.html
RSYNC_PROTECT_TMP_FILES=(--filter "P .*.??????")


variant_for_slice()
{
  case "$1" in
  "RongChatRoom.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongChatRoom.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongContactCard.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongContactCard.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongCustomerService.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongCustomerService.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongDiscussion.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongDiscussion.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongIMKit.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongIMKit.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongIMLib.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongIMLib.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongIMLibCore.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongIMLibCore.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongLocation.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongLocation.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongLocationKit.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongLocationKit.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongPublicService.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongPublicService.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongSticker.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongSticker.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  "RongSight.xcframework/ios-i386_x86_64-simulator")
    echo "simulator"
    ;;
  "RongSight.xcframework/ios-arm64_armv7")
    echo ""
    ;;
  esac
}

archs_for_slice()
{
  case "$1" in
  "RongChatRoom.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongChatRoom.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongContactCard.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongContactCard.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongCustomerService.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongCustomerService.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongDiscussion.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongDiscussion.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongIMKit.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongIMKit.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongIMLib.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongIMLib.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongIMLibCore.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongIMLibCore.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongLocation.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongLocation.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongLocationKit.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongLocationKit.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongPublicService.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongPublicService.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongSticker.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongSticker.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  "RongSight.xcframework/ios-i386_x86_64-simulator")
    echo "i386 x86_64"
    ;;
  "RongSight.xcframework/ios-arm64_armv7")
    echo "arm64 armv7"
    ;;
  esac
}

copy_dir()
{
  local source="$1"
  local destination="$2"

  # Use filter instead of exclude so missing patterns don't throw errors.
  echo "rsync --delete -av "${RSYNC_PROTECT_TMP_FILES[@]}" --links --filter \"- CVS/\" --filter \"- .svn/\" --filter \"- .git/\" --filter \"- .hg/\" \"${source}*\" \"${destination}\""
  rsync --delete -av "${RSYNC_PROTECT_TMP_FILES[@]}" --links --filter "- CVS/" --filter "- .svn/" --filter "- .git/" --filter "- .hg/" "${source}"/* "${destination}"
}

SELECT_SLICE_RETVAL=""

select_slice() {
  local xcframework_name="$1"
  xcframework_name="${xcframework_name##*/}"
  local paths=("${@:2}")
  # Locate the correct slice of the .xcframework for the current architectures
  local target_path=""

  # Split archs on space so we can find a slice that has all the needed archs
  local target_archs=$(echo $ARCHS | tr " " "\n")

  local target_variant=""
  if [[ "$PLATFORM_NAME" == *"simulator" ]]; then
    target_variant="simulator"
  fi
  if [[ ! -z ${EFFECTIVE_PLATFORM_NAME+x} && "$EFFECTIVE_PLATFORM_NAME" == *"maccatalyst" ]]; then
    target_variant="maccatalyst"
  fi
  for i in ${!paths[@]}; do
    local matched_all_archs="1"
    local slice_archs="$(archs_for_slice "${xcframework_name}/${paths[$i]}")"
    local slice_variant="$(variant_for_slice "${xcframework_name}/${paths[$i]}")"
    for target_arch in $target_archs; do
      if ! [[ "${slice_variant}" == "$target_variant" ]]; then
        matched_all_archs="0"
        break
      fi

      if ! echo "${slice_archs}" | tr " " "\n" | grep -F -q -x "$target_arch"; then
        matched_all_archs="0"
        break
      fi
    done

    if [[ "$matched_all_archs" == "1" ]]; then
      # Found a matching slice
      echo "Selected xcframework slice ${paths[$i]}"
      SELECT_SLICE_RETVAL=${paths[$i]}
      break
    fi
  done
}

install_xcframework() {
  local basepath="$1"
  local name="$2"
  local package_type="$3"
  local paths=("${@:4}")

  # Locate the correct slice of the .xcframework for the current architectures
  select_slice "${basepath}" "${paths[@]}"
  local target_path="$SELECT_SLICE_RETVAL"
  if [[ -z "$target_path" ]]; then
    echo "warning: [CP] $(basename ${basepath}): Unable to find matching slice in '${paths[@]}' for the current build architectures ($ARCHS) and platform (${EFFECTIVE_PLATFORM_NAME-${PLATFORM_NAME}})."
    return
  fi
  local source="$basepath/$target_path"

  local destination="${PODS_XCFRAMEWORKS_BUILD_DIR}/${name}"

  if [ ! -d "$destination" ]; then
    mkdir -p "$destination"
  fi

  copy_dir "$source/" "$destination"
  echo "Copied $source to $destination"
}

install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongChatRoom.xcframework" "RongCloudIM/ChatRoom" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongContactCard.xcframework" "RongCloudIM/ContactCard" "framework" "ios-arm64_armv7" "ios-i386_x86_64-simulator"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongCustomerService.xcframework" "RongCloudIM/CustomerService" "framework" "ios-arm64_armv7" "ios-i386_x86_64-simulator"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongDiscussion.xcframework" "RongCloudIM/Discussion" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongIMKit.xcframework" "RongCloudIM/IMKit" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongIMLib.xcframework" "RongCloudIM/IMLib" "framework" "ios-arm64_armv7" "ios-i386_x86_64-simulator"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongIMLibCore.xcframework" "RongCloudIM/IMLibCore" "framework" "ios-arm64_armv7" "ios-i386_x86_64-simulator"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongLocation.xcframework" "RongCloudIM/Location" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongLocationKit.xcframework" "RongCloudIM/LocationKit" "framework" "ios-arm64_armv7" "ios-i386_x86_64-simulator"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongPublicService.xcframework" "RongCloudIM/PublicService" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongSticker.xcframework" "RongCloudIM/RongSticker" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"
install_xcframework "${PODS_ROOT}/RongCloudIM/RongCloudIM/RongSight.xcframework" "RongCloudIM/Sight" "framework" "ios-i386_x86_64-simulator" "ios-arm64_armv7"

