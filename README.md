# vpn_easy_config
Very easy (but not very secure) pki configuration for openvpn

Usage:

Edit client_base.conf and server.conf to your liking.

./server.sh 

./client.sh client_1

./client.sh client_2


This will create a ./pki directory containing the certificate authority and all issued certificates

A ./server_output directory for all files to go in the /etc/openvpn folder

A ./client_output directory for all client configs

./server.conf is an example openvpn server config. Place this in /etc/openvpn

Please note this configuration is only meant as a starting point. It is not secure and not meant to protect any important infrastructure.
