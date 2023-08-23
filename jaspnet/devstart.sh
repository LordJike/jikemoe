#!/bin/sh

#Requires dotnet SDK and must be run on sudo

dotnet run 

NGINXUP=$(systemctl is-active nginx)

if [$NGINXUP = active]
