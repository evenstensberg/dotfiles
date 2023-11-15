#!/bin/bash

CERT_DIR="/etc/ssl/certs"

for cert in $CERT_DIR/*.crt; do
    echo "Checking expiry date for $cert"
    sudo openssl x509 -noout -dates -in $cert
    echo ""
done