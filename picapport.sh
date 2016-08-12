#!/bin/bash

java -DTRACE=INFO -Duser.home=/opt/jboss/picapport -Dpicapport.directory=data -cp picapport-headless_v6.1.00.jar de.contecon.picapport.PicApport -configfile=/opt/jboss/picapport/picapport.properties -pgui.enabled=false
