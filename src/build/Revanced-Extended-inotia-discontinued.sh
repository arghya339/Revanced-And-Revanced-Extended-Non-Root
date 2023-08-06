#!/bin/bash
# Revanced Extended build
source src/build/utils.sh

#################################################

# Checking new patch
checker "inotia00/revanced-patches" "revanced-extended-inotia-discontinued"

#################################################

# Download requirements
dl_gh "revanced-patches revanced-cli revanced-integrations" "inotia00" "latest"
dl_htmlq

#################################################

# Patch YouTube Extended:
get_patches_key "youtube-revanced-extended"
get_ver "Hide general ads" "com.google.android.youtube"
get_apk "youtube" "youtube" "google-inc/youtube/youtube"
patch "youtube" "youtube-revanced-extended-inotia-discontinued"

#################################################

# Patch YouTube Music Extended:
# Arm64-v8a
get_patches_key "youtube-music-revanced-extended"
get_apk "youtube-music-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
patch "youtube-music-arm64-v8a" "youtube-music-arm64-v8a-revanced-extended-inotia-discontinued"
# Armeabi-v7a
get_patches_key "youtube-music-revanced-extended"
version="6.08.51"
get_apk "youtube-music-armeabi-v7a" "youtube-music" "google-inc/youtube-music/youtube-music" "armeabi-v7a"
patch "youtube-music-armeabi-v7a" "youtube-music-armeabi-v7a-revanced-extended-inotia-discontinued"

#################################################

# Patch Reddit:
get_patches_key "reddit"
get_apk "reddit" "reddit" "redditinc/reddit/reddit"
patch "reddit" "reddit-revanced-extended-inotia-discontinued"

#################################################

# Split architecture:
rm -f revanced-cli*
dl_gh "revanced-cli" "j-hc" "latest"
# Split architecture Youtube:
for i in {0..3}; do
    split_arch "youtube-revanced-extended-inotia-discontinued" "youtube-${archs[i]}-revanced-extended-inotia-discontinued" "$(gen_rip_libs ${libs[i]})"
done

#################################################