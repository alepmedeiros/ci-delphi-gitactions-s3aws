#!/bin/sh -l

echo -e "${INPUT_KEY}" > TMP_INPUT_KEY

chmod 777 TMP_INPUT_KEY

echo "=====key===="
echo "${INPUT_KEY}"
echo "============"
echo ""
echo "====PORT====="
echo "${INPUT_PORT}"
echo "============="
echo ""
echo "=====SRC====="
echo "${INPUT_SCR}"
echo "============="
echo ""
echo "====USER====="
echo "${INPUT_USER}"
echo "============="
echo ""
echo "====HOST====="
echo "${INPUT_HOST}"
echo "============="
echo ""
echo "====REMOTE==="
echo "${INPUT_REMOTE}"
echo "============="
echo ""

scp -i TMP_INPUT_KEY -P "${INPUT_PORT}" -r ${INPUT_SRC} "${INPUT_USER}"@"${INPUT_HOST}":"${INPUT_REMOTE}"
