set -o errexit

# Atualizar o Ruby e as gems
# Atualizar todas as gems, incluindo o gem 'debug' e suas dependências
bundle update
bundle update --ruby



#bundle config --delete cache_all


# Instalar as gems, garantindo que todas as dependências sejam baixadas
bundle install --full-index

# Compilar os assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Executar as migrações do banco de dados
bundle exec rails db:migrate
