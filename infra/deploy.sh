#!/bin/bash

#déplacement dans le dossier infra
cd infra

#initialiser et déployer le terraform
terraform init
terraform apply