#!/bin/bash
easyrsa init-pki
export EASYRSA_BATCH=1
easyrsa gen-req server nopass
easyrsa build-ca nopass
easyrsa sign-req server server

easyrsa gen-dh
openvpn --genkey --secret ./pki/ta.key

mkdir -p server_output
cp ./pki/private/server.key ./server_output
cp ./pki/issued/server.crt ./server_output
cp ./pki/ca.crt ./server_output
cp ./pki/ta.key ./server_output
cp ./pki/dh.pem ./server_output

echo Now run
echo cp ./server_output/\* /etc/openvpn/
