#!/bin/bash
CLIENT=$1
echo Generating a key for $CLIENT
export EASYRSA_BATCH=1
export EASYRSA_REQ_CN=$CLIENT
easyrsa gen-req $CLIENT nopass
easyrsa sign-req client $CLIENT

CA_DIR=./pki
CRT_DIR=./pki/issued
KEY_DIR=./pki/private
TA_DIR=./pki
OUTPUT_DIR=./client_output
BASE_CONFIG=./client_base.conf

mkdir -p $OUTPUT_DIR

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${CA_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${CRT_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-crypt>') \
    ${TA_DIR}/ta.key \
    <(echo -e '</tls-crypt>') \
    > ${OUTPUT_DIR}/${1}.ovpn
