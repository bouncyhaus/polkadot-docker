#!/bin/sh
set -x
set -e

if [ ! -z "$NAME" ]; then
  name_param="--name \"$NAME\""
fi

if [ ! -z "$CHAIN" ]; then
  chain_param="--chain \"$CHAIN\""
fi

if [ ! -z "$DATABASE" ]; then
  database_param="--database \"$DATABASE\""
fi

if [ ! -z $WASM_EXECUTION ]; then
  wasm_execution_param="--wasm-execution $WASM_EXECUTION"
fi

if [ ! -z $PUBLIC_ADDR ]; then
  public_addr_param="--public-addr $PUBLIC_ADDR"
fi

if [ ! -z $PRUNING ]; then
  pruning_param="--pruning $PRUNING"
fi

if [ ! -z $TELEMETRY_URL ]; then
  telemetry_url_param="--telemetry-url \"$TELEMETRY_URL\""
fi

if [ $UNSAFE_RPC_EXTERNAL ]; then
  unsafe_rpc_external_param="--unsafe-rpc-external"
fi

if [ $UNSAFE_WS_EXTERNAL ]; then
 unsafe_ws_external_param="--unsafe-ws-external"
fi

eval "exec /usr/local/bin/polkadot \
  --validator \
  --unsafe-pruning \
  $name_param \
  $chain_param \
  $database_param \
  $wasm_execution_param \
  $public_addr_param \
  $telemetry_url_param \
  $pruning_param \
  $unsafe_rpc_external_param \
  $unsafe_ws_external_param"


