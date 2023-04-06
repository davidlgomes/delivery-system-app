
Sistema de Entregas

Data de entrega deste projeto: 29/05/2022
Introdução

Você construir uma aplicação real usando boas práticas de programação. Durante a execução do projeto, além dos vídeos e encontros online, a Campus Code vai enviar dicas e conteúdos extras via Slack para que você possa incrementar seu código.

O projeto a ser desenvolvido é o de uma aplicação web responsável por gerenciar meios de transporte disponíveis para e-commerces. Teremos várias transportadoras cadastradas e cada uma delas deverá configurar seus preços de entrega e seus prazos. As transportadoras podem receber ordens de serviço dentro da plataforma. Uma ordem de serviço, quando aceita, deve permitir que um visitante faça o rastreamento de sua entrega através de seu código.

Usuários das transportadoras devem configurar os preços praticados pela transportadora de acordo com a distância e dimensões da carga. Os prazos também devem ser configurados de acordo com a distância a ser percorrida.

O sistema terá usuários administradores que irão cadastrar as transportadoras e fazer consultas de orçamento envolvendo todas as transportadoras cadastradas. Os administradores também serão responsáveis por criar uma nova ordem de serviço para as transportadoras.
Resumo de Funcionalidades

Gestão de Transportadoras

Um administrador do sistema deve ser capaz de cadastrar novas transportadoras informando nome fantasia, razão social, domínio dos e-mails (exemplo: minhatransportadora.com.br), CNPJ e endereço para faturamento. Uma transportadora irá receber ordens de serviço para realizar entregas. Para isto é preciso que a transportadora possua uma tabela de preços e prazos configurados.

Uma transportadora pode ser desativada por um administrador do sistema. Neste caso, os usuários da transportadora seguem com acesso à plataforma, mas a transportadora não é mais considerada em novas consultas de preços e, consequentemente, não deve receber novas ordens de serviço.

Usuários administradores e de transportadoras

O acesso ao sistema é realizado através de um e-mail e uma senha e existem dois tipos de usuários: administradores e usuários de transportadoras. Administradores devem ser usuários com e-mail do domínio @sistemadefrete.com.br.

O usuário de uma transportadora deve ser capaz de acessar somente os dados da sua empresa. Ao criar uma conta no sistema, o sistema deve vincular automaticamente um novo usuário com sua transportadora através do domínio do e-mail informado pelo usuário.

Cadastro de Veículos

Um usuário da transportadora deve ser capaz de cadastrar os veículos utilizados em suas entregas. Cada cadastro deve armazenar a placa de identificação, a marca e o modelo do veículo, o ano de fabricação e a capacidade máxima de carga (peso).

Configuração de preços

Cada transportadora deve fazer sua configuração de preços de acordo com as dimensões, peso e distância em km da entrega. Os preços devem considerar o volume em metros cúbicos e o peso do produto e devem ser cadastrados em intervalos. Por exemplo:
Metros cúbicos 	Peso 	Valor por km
0,001 a 0,500 	0 a 10kg 	R$ 0,50
0,001 a 0,500 	10 a 30 kg 	R$ 0,80
0,001 a 0,500 	Acima de 30kg 	R$ 1,00
0,501 a 1,000 	0 a 10kg 	R$ 0,75

E assim em diante.

Além da configuração de preço de acordo com a tabela acima, a transportadora pode determinar um valor mínimo de cobrança de frete baseado exclusivamente na distância percorrida. Ou seja, durante o processo de cálculo de frete deve ser validado o valor mínimo de acordo com a quilometragem, evitando prejuízos.

Configuração de prazos

Cada transportadora deve fazer sua configuração de prazos de entrega de acordo com a distância entre a origem e o destino. O prazo pode ser calculado como um fator de dias úteis a partir da distância. O cadastro pode ser feito a partir de intervalos de distância, por exemplo: para entregas de 0 a 100km, o prazo é de 2 dias úteis; de 101km a 300km, o prazo é de 5 dias úteis etc.

Consulta de preços

A aplicação deve permitir aos administradores a realização de consultas de preço de frete. Para isso deverão ser informados: as dimensões do item a ser transportado, o peso e a distância a ser percorrida. Com estas informações deve ser feito o cálculo do frete e retornar todos as transportadoras com suas respectivas taxas de entrega e prazos.

Todas as transportadoras ativas devem ser consideradas, desde que possuam preço configurado que atenda as dimensões e a distância do pedido.

O resultado de uma consulta de preços deve ser armazenado para consultas futuras.

Criar Ordem de Serviço

Um administrador deve ser capaz de cadastrar uma nova ordem de serviço para uma transportadora. Devem ser informados os dados para retirada do produto (endereço completo, código identificador do produto a ser retirado, dimensões e peso) e as informações para entrega como endereço completo e dados do destinatário.

Uma ordem de serviço recém criada é considerada "pendente de aceite" pela transportadora. Toda ordem de serviço deve possuir um código identificador único gerado automaticamente. O código deve possuir 15 caracteres alfanuméricos e será utilizado para o rastreamento da entrega.

Atualizar Ordem de Serviço

Usuários da transportadora devem ver todos os pedidos encaminhados para a sua transportadora. Uma ordem de serviço pendente de aceite deve ser aprovada ou reprovada. Ao aprovar um pedido, o usuário deve vincular um veículo da transportadora à ordem de serviço.

Ordens de serviço aprovadas devem receber atualizações de rota. Cada atualização de rota deve conter uma data e hora, além de indicar uma coordenada geográfica de posição do caminhão responsável pela entrega. Ao fim da rota, a ordem de serviço deve ser atualizada como o status "finalizado".

Consulta de Entrega

Uma pessoa não autenticada deve ser capaz de consultar o status de uma entrega informando o código de rastreamento da entrega. Na página de resultado devem ser exibidos o endereço de saída, o endereço de entrega e todas as atualizações de trajeto existentes.
Regras e Recomendações

    O projeto deve ser construído de forma incremental, ou seja, esperamos que você atualize seu repositório no Github ou Gitlab com novos commits a cada nova funcionalidade finalizada. Dessa forma, conseguimos acompanhar e proporcionar feedbacks mais pontuais que podem te ajudar na continuidade do trabalho.
    O sistema deve ser construído usando Ruby on Rails e usando testes com as gems RSpec e Capybara devidamente configuradas. O banco de dados deve ser o SQLite e todas dependências adicionais devem ser instaladas automaticamente com os comandos bundle install ou bin/setup.
    O arquivo README.md deve conter uma descrição do projeto, instruções para executar o projeto e os testes, gems adicionais utilizadas (com justificativa do seu uso) etc.
    Você pode (e deve) organizar seu trabalho em alguma plataforma como Trello ou dentro do próprio Github ou Gitlab usando a área de projetos, assim ficará mais fácil acompanharmos sua linha de raciocínio. Fique à vontade para utilizar qualquer outro recurso como fluxogramas, mocks de telas etc. Todos os links de ferramentas, documentos e imagens que você deseja compartilhar com a Campus Code devem ser listados também no arquivo README.md do seu projeto.
    Para construir as interfaces, é recomendado, mas não obrigatório, o uso do Bootstrap.
    Você pode utilizar outras bibliotecas ou frameworks para o front-end, assim como construir seu próprio CSS, mas entenda que essa não é uma prioridade no projeto.
    Ao criar modelos, telas e formulários, você deve escolher os campos utilizados, assim como seus tipos de dados. Por exemplo: determinar se um campo ‘status’ é boolean ou enum faz parte das atividades do projeto.

Link do projeto: https://github.com/davidlgomes/delivery-system-app




Cadastro de Transportadoras Finalizada - Finalizada em: 23 de Maio, 01:40
Cadastro de Veículos Finalizada - Finalizada em: 29 de Maio, 22:38
Cadastro de preços Finalizada - Finalizada em: 29 de Maio, 22:38
Cadastro de Prazos Finalizada - Finalizada em: 31 de Maio, 10:17
Criar Ordem de Serviço Pendente
Aceitar Ordem de Serviço Pendente
Atualizar detalhes da entrega Pendente
Consulta de Orçamento Pendente
Consulta de Entrega Pendente
