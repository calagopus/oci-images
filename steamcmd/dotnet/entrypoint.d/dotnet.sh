#!/bin/bash

# Print .NET runtimes
printf "\033[1m\033[33mcontainer@calagopus~ \033[0mdotnet --list-runtimes\n"
dotnet --list-runtimes
