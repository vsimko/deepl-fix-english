#!/bin/sh

# Created by Viliam Simko (viliam.simko@gmail.com)
# requires: curl and jq (sudo apt install jq curl)

deepl() {
  TARGET_LANG="$1"
  RAWTEXT=$(cat)
  
  curl \
    'https://www.deepl.com/jsonrpc' \
    --data-binary \
    '{
      "method": "LMT_handle_jobs",
      "params": {
        "jobs": [
          {
            "raw_en_sentence": "'"$RAWTEXT"'"
          }
        ],
        "lang": {
          "source_lang_user_selected": "auto",
          "target_lang": "'"$TARGET_LANG"'"
        },
        "priority": 1
      }
    }' --compressed | jq -a '.result.translations[].beams[1].postprocessed_sentence' | sed 's/"//g'
}

if [ $# -gt 0 ]; then

  # from command line arguments
  echo "$@" | deepl DE | deepl EN
  
else

  # from stdin
  deepl DE | deepl EN
  
fi
