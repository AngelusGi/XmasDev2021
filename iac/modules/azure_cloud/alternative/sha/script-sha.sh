#!/bin/bash
sudo su -
sudo useradd -m ElfAgent
HomeDIR=/root
HomeUSERAGENT=/home/ElfAgent

# last agent availabe 16-dec-2021
wget "https://vstsagentpackage.azureedge.net/agent/2.187.2/vsts-agent-linux-x64-2.187.2.tar.gz" -k -O vsts-agent-linux-x64-2.187.2.tar.gz
mkdir /agent && mv vsts-agent-linux-x64-2.187.2.tar.gz /agent && cd /agent
tar xvzf vsts-agent-linux-x64-2.187.2.tar.gz
sudo -u ElfAgent ./config.sh --unattended --url https://dev.azure.com/<YOUR-DEVOPS-ORG-NAME>/ --auth pat --token <YOUR-AZ-DEVOPS-PAT> --pool <AZ-DEVOPS-POOL-NAME> --agent <AZ-VM-NAME> --replace --work _work
./svc.sh install ElfAgent
./svc.sh start ElfAgent
