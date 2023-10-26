#!/bin/bash

CIRCUITS_PATH="./circuits/"

cd $CIRCUITS_PATH

for circuit in */; do
    cd $circuit
    CIRCUIT_NAME=${circuit%?}

    nargo test

    echo "[$CIRCUIT_NAME] compiling circuit"
    nargo compile
    echo "[$CIRCUIT_NAME] circuit compiled successfully"

    echo "[$CIRCUIT_NAME] generating solidity verifier"
    nargo codegen-verifier
    mv ./contract/${CIRCUIT_NAME}/plonk_vk.sol ./target/${CIRCUIT_NAME}.sol
    echo "[$CIRCUIT_NAME] moved solidity verifier to /target"
    rm -rf ./contract
    echo "[$CIRCUIT_NAME] solidity verifier generated"

    cd ..

done