#!/bin/bash

echo "---Prepare Server---"
chmod -R ${DATA_PERM} ${DATA_DIR}
echo "---Server ready---"

echo "---Sleep zZz---"
sleep infinity

echo "---Start Server---"
cd ${DATA_DIR}