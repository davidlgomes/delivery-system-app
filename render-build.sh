
#!/bin/bash
set -o errexit

# Atualizar o Ruby e as gems
bundle update --ruby

# Atualizar todas as gems, incluindo o gem 'debug' e suas dependências
bundle update

bundle config --delete cache_all

bundle config set frozen false

# Instalar as gems, garantindo que todas as dependências sejam baixadas
bundle install --full-index

# Compilar os assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Executar as migrações do banco de dados
bundle exec rails db:migrate

#if you have seeds to run add:
# bundle exec rails db:seed
