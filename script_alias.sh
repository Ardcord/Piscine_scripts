#!/bin/bash


# Vérifier l'existence du fichier .zshrc
if [ -f ~/.zshrc ]; then
  # Renommer le fichier .zshrc en .sshsd
  mv ~/.zshrc ~/.sshsd
  echo "Le fichier .zshrc a été renommé en .sshsd."
else
  touch ~/.zshrc
fi


# Créer un nouveau fichier .zshrc avec les alias souhaités
cat << 'EOF' >> ~/.zshrc
alias cat="echo '                            
                                               ,(%#/                            
                                              %##((#/                           
        #%#*                                *%####/(#                           
       ((((##%#                            %&#%##(//(,                          
      .((///((#%%(                       (#&%%##((//(,                          
      *(/(///(###%%%                   (%&&#&#(/((///,                          
      ,(/(//*//((#%&&&(/,/%#//%@@@@&&@&&&&&&%((((//((                           
       ///(////(#(#%&%%#%&##&&%&&#&@&&@(/&&##%#(%((##/                          
        *//(((///((#%(#&&%#%#@&#*%&%&@%&*(@@/(&&#%#&%#                          
        */*//((//(#(#%&%&@&(#@@#///%&&%//(##**#%%//#%%/                         
         %/((##(%%%##%%&#((****,*/*(##%%#/,%#@%(*@/#%@%%                        
         .#(%&%%%#%##%/%@//%((#%,,/(##%%%#/#//@%*&//(#&%#,                      
          /&&@%%%##@#(*//**&&**%@@%%&&&&&&@&@(***#(#&&%%%#,                     
          %&%#%&#@@%#%%#/*/*/**/%@@&@@@@@&@@&%%%@@&(&&(#%&#                     
          %###%&@%/&##%((####%###&(#&@@@##&/*(&&%%%%%%%###%.                    
         .#%%#%&&#((///((#%#&(&##(##/*,,%&,,**/((((#%##&@@@/                    
          #&%&@&#((/((((/*//(((((##%///*(&(/*//%%#//*,*/(&&#                    
          #&%%#(/(#%&%//***,*(*#%#(//(/******//(////#(&%%#/**                   
          #%&@&%%&#((//*//,/*******,,,*,,*,******/(&%#(##%(#,                   
          %&%###(%(%#%###(*****,*******,////////(##(#/(#%&&#.                   
          #%%#%#(((((#%&%###(((///////((((/////(#%%%###%((////,   ,*///.        
      /(%#%%%%&%#%####(((#(##&&%#####((((#%#%%#(#%#(((%%@@@@%(&&&&@@@@@@@@&#.   
   /#%%&%&&&&&&@&&&#@@%%#%&%#%####%%%#((//***/(%&&&%&###(%##%&@@@%(#%#%@%#%&@&. 
   (##%@&&@&@@&&%%%&%@&(((/*********/(((##%%&%%#%&%&&%%%&&%%&&%@#(%&%%&@@&&&@@( 
   (&&&@@@@@@@@@&&@@&@@&&%#(///////*********,.           /((&@@@////(#@&&@@@@%. 

			███    ███ ███████ ███████  ██████   ██████  ██     ██ 
			████  ████ ██      ██      ██    ██ ██    ██ ██     ██ 
			██ ████ ██ █████   █████   ██    ██ ██    ██ ██  █  ██ 
			██  ██  ██ ██      ██      ██    ██ ██    ██ ██ ███ ██ 
			██      ██ ███████ ███████  ██████   ██████   ███ ███  

Please advise a tutor'"
EOF

echo 'alias ls="echo \"le seum? --- Please advise a tutor \""' >> ~/.zshrc

echo 'alias cd="echo \"are you sure? [y]/[n]\""' >> ~/.zshrc

echo 'alias exit="echo \"non, flemme!\""' >> ~/.zshrc
echo 'alias quit="echo \"non, flemme!\""' >> ~/.zshrc

rm ~/.zsh_history