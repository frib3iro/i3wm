# Gerando chave ssh

# Digite ls -al ~/.ssh para verificar se as chaves SSH existentes estão presentes.
ls -al ~/.ssh

# Cole o texto abaixo, substituindo o endereço de e-mail pelo seu GitHub.
ssh-keygen -t ed25519 -C "rib3iro@live.com"

# Inicie o ssh-agent em segundo plano.
eval "$(ssh-agent -s)"

# Adicione sua chave SSH privada ao ssh-agent.
ssh-add ~/.ssh/id_ed25519

# Copie a chave pública SSH para a sua área de transferência e adicione ao github.
cat ~/.ssh/id_ed25519.pub | xclip

# Testar a conexão SSH
ssh -T git@github.com
