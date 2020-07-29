#!/bin/sh -l

echo -e "${INPUT_KEY}" > TMP_INPUT_KEY

chmod 777 TMP_INPUT_KEY

scp -i TMP_INPUT_KEY -P "${INPUT_PORT}" -r ${INPUT_SRC} "${INPUT_USER}"@"${INPUT_HOST}":"${INPUT_REMOTE}"
