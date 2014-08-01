# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Daley', city: cities.first)

cf=Blog.create!(blog_name: 'Comunidade Fruga',
  blog_subtitle: 'vida consciente e deliberada', 
  lang: 'pt_PT', 
  base_url: 'http://comunidade.fruga.pt',
  email_from: 'info@fruga.pt',
  allow_signup: 1,
  global_pings_disable: 1,
  send_outbound_pings: 0,
  default_allow_pings: 0,
  default_allow_comments: 1,
  default_moderate_comments: 1,
  link_to_author: 0,
  date_format: 'setting_date_format_distance_of_time_in_words',
  time_format: '%Hh%M',
  geourl_location: '41.24538, -8.66425',

  custom_tracking_field: '',
  twitter_consumer_key: '',
  twitter_consumer_secret: '',
  custom_url_shortener: '',
  statuses_in_timeline: 1,

  # Spam
  #sp_article_auto_close,      :integer, 0
  #sp_akismet_key,             :string, ''
  #use_recaptcha,              :boolean, false
  sp_global: 1,
  sp_url_limit: 2,

  # SEO,
  meta_description:            'A Comunidade Fruga está dedicada a aprender sobre como viver de forma consciente e deliberada, simplificando a vida criando novas formas de fazer as coisas e com-partilhando ideias para aumentar a nossa felicidade',
  meta_keywords:               'comunidade, fruga, aprender, informar, educar, viver, consciente, deliberada, felicidade',
  google_analytics:            'UA-38353037-6',
  rss_description:             1,
  rss_description_text:        "<hr/><p><small>Artigo original escrito por %author% e publicado na <a href='%blog_url%'>%blog_name%</a> | <a href='%permalink_url%'>link direto para este artigo</a> | Se está a ler este artigo noutro lugar que não seja na <a href='%blog_url%'>%blog_name%</a>, então este contéudo foi ilegalmente reproduzido e sem a devida autorização</small></p>.",
  permalink_format:            '/%year%/%month%/%day%/%title%',
  #feedburner_url:              '',
  #robots:                      '',
  #google_verification:         '',
  #text_filter:                 'markdown smartypants'
  #comment_text_filter:         'markdown smartypants'
  text_filter:                 'none',
  comment_text_filter:         'none',

  unindex_categories:          1,
  unindex_tags:                1,
  admin_display_elements:      10,
  limit_article_display:       4,
  dofollowify:                 1,
  use_canonical_url:           1,
  use_meta_keyword:            true,
  home_title_template:         "%blog_name% | %blog_subtitle%",
  home_desc_template:          "%blog_name% | %blog_subtitle% | %meta_keywords%",
  article_title_template:      "%title% | %blog_name%",
  article_desc_template:       "%excerpt%",
  page_title_template:         "%title% | %blog_name%",
  page_desc_template:          "%excerpt%",
  paginated_title_template:    "%blog_name% | %blog_subtitle% %page%",
  paginated_desc_template:     "%blog_name% | %blog_subtitle% | %meta_keywords% %page%",
  tag_title_template:          "Tag: %name% | %blog_name% %page%",
  tag_desc_template:           "%name% | %blog_name% | %blog_subtitle% %page%",
  author_title_template:       "%author% | %blog_name%",
  author_desc_template:        "%author% | %blog_name% | %blog_subtitle%",
  archives_title_template:     "Archives for %blog_name% %date% %page%",
  archives_desc_template:      "Archives for %blog_name% %date% %page% %blog_subtitle%",
  search_title_template:       "Results for %search% | %blog_name% %page%",
  search_desc_template:        "Results for %search% | %blog_name% | %blog_subtitle% %page%",
  statuses_title_template:     "Notes | %blog_name% %page%",
  statuses_desc_template:      "Notes | %blog_name% | %blog_subtitle% %page%",
  status_title_template:       "%body% | %blog_name%",
  status_desc_template:        "%excerpt%"
)

adm = Profile.create(label: 'admin', nicename: 'Administrador',
  modules: [:dashboard, :articles, :notes, :pages, :feedback, :media, :themes, :sidebar, :profile, :users, :settings, :seo])
pub = Profile.create(label: 'publisher', nicename: 'Editor',
  modules: [:dashboard, :articles, :notes, :pages, :feedback, :media, :profile])
col = Profile.create(label: 'contributor', nicename: 'Colaborador',
  modules: [:dashboard, :profile ])

fr=User.create(firstname: 'Fruga',
  lastname: 'Portugal',
  nickname: 'frugapt',
  name: 'Fruga Portugal',
  login: 'frugapt',
  email: 'gestao@fruga.pt',
  description: 'Administradora da comunidade fruga',
  profile_id: adm.id, 
  notify_via_email: true, 
  notify_on_new_articles: true, 
  notify_on_comments: true 
)
fr.generate_password!
fr.save

#TagSidebar.create(active_position: 0, staged_position: 0, maximum_tags: 5 )
PopularSidebar.create(active_position: 0,staged_position: 0,title: 'Artigos populares',count: 5)
ArchivesSidebar.create(active_position: 1,title: 'Arquivo',show_count: true,count: 6)
#SearchSidebar.create(active_position: 2,title: 'Pesquisa')
#PageSidebar.create(active_position: 3,maximum_pages: 5)
#StaticSidebar.create(active_position: 2,title: 'Links',
# Para activar quando mercado estiver activo
#<li><br></li>
#<li><a href="http://fruga.herokuapp.com" title="Fazer compras no mercado de credito mutuo directo - sem necessitar de dinheiro" target="_new">Mercado Fruga</a></li>
#<li><br></li>
# Para activar usado micropagamentos em bitcoin
#<li><form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
#<input type="hidden" name="cmd" value="_s-xclick">
#<input type="hidden" name="hosted_button_id" value="FRMBTEZ6WULMY">
#<input type="image" src="http://www.fruga.pt/images/cm-doar.png" border="0" name="submit" alt="PayPal - A maneira mais fácil e segura de efectuar doações online!" title="Fazer uma doação à comunidade fruga de forma fácil e segura usando PayPal">
#<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
#</form></li>
#  body: %q{
#<ul class="list-unstyled">
#<li><a href="https://plus.google.com/107330188100365112175" rel="publisher" title="Fruga no Google+" target="_new">Fruga no Google+</a></li>
#<li><a href="http://www.facebook.com/fruga.portugal" title="Fruga no facebook" target="_new">Fruga no facebook</a></li>
#<li><a href="http://twitter.com/frugapt" title="Fruga no twitter" target="_new">Fruga no twitter</a></li>
#<li><a href="http://pt.linkedin.com/in/frugapt" title="Fruga no linkedin" target="_new">Fruga no linkedin</a></li>
#</ul>
#}
#  )

TextFilter.create(name: 'none', description: 'None', markup: 'none', filters: [], params: {})
TextFilter.create(name: 'markdown', description: 'Markdown', markup: "markdown", filters: [], params: {})
TextFilter.create(name: 'smartypants', description: 'SmartyPants', markup: 'none', filters: [:smartypants], params: {})
TextFilter.create(name: 'markdown smartypants', description: 'Markdown with SmartyPants', markup: 'markdown', filters: [:smartypants], params: {})
TextFilter.create(name: 'textile', description: 'Textile', markup: 'textile', filters: [], params: {})

tc = Tag.create(display_name: 'Comunidade')
tm = Tag.create(display_name: 'Mercado')
t1 = Tag.create(display_name: 'Consciência',name: 'consciencia')
t2 = Tag.create(display_name: 'Economia')

a1 = Article.create(
  title: 'Bem vindo à comunidade fruga',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'comunidade-fruga',
  tags: [tc]
)
a1.body_and_extended=%q{Na comunidade fruga estamos dedicados a viver de forma consciente e deliberada sorvendo toda a essência da vida afim de derrotar tudo o que é não-viver.
<!--more-->
Estamos dedicados a facilitar a conquista mais importante do ser humano - separar consciência e pensamentos.
Perceber que não somos os nossos pensamentos, que somos aquilo que observa esses pensamentos.
Reconhecer que as principais causas do sofrimento humano raramente são as situações que acontecem, mas sim os nossos pensamentos sobre essas situações.
Na comunidade fruga estamos concentrados em simplificar, criando novas formas de fazer as coisas, compartilhando ideias para melhorar a nossa felicidade.
Estamos ainda dedicados a criar um mercado de credito mutuo directo entre os nossos membros permitindo assim uma maior concentração na comunidade e nos seus objectivos esquecendo uma das maiores preocupações actuais - o problemas económicos e financeiros:
<br/><br/>
<iframe allowfullscreen='' frameborder='0' height='259' width='460' src='http://www.youtube.com/embed/NmFnwkwbjiI?rel=0'></iframe>
} 
a1.save

a2 = Article.create(
  title: 'A mais recente crise financeira explicada',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'crise-financeira-explicada',
  tags: [tc, t2]
)
a2.body_and_extended=%q{O termo crise financeira é aplicado a uma variedade de situações nas quais instituições ou activos financeiros se desvalorizam repentinamente. No século XIX e no início do século XX, muitas crises financeiras estiveram associadas a corridas aos bancos, durante períodos de recessão. Outras caracterizaram-se pelo estouro de uma bolha financeira e pela quebra do mercado de acções ou por ataques especulativos à moeda de um país ou quando um país suspende o pagamento de sua dívida.
<!--more-->
Há várias teorias acerca do desenvolvimento das crises financeiras e como evitá-las. Entretanto, não há consenso entre os economistas. As crises continuam a ocorrer por todo o mundo e parecem produzir-se com certa regularidade, podendo ser inerentes ao funcionamento da economia capitalista. Nos dias actuais, a Crise económica de 2008, que atingiu todo o planeta, é a mais forte desde a Crise de 1929.
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="259" src="http://www.youtube.com/embed/kC_943HEla4?rel=0" width="460"></iframe>
} 
a2.save

a3 = Article.create(
  title: 'Resposta à crise',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'resposta-crise',
  tags: [tc, t2]
)
a3.body_and_extended=%q{A actual crise europeia tornou difícil ou até mesmo impossível, o pagamento ou refinanciamento da dívida pública europeia sem a ajuda de terceiros. A partir do final de 2009, o receio de uma crise de dívida pública desenvolveu-se entre os investidores tendo como resultado o aumento dos níveis de endividamento do governo e entidades privadas. Por outro lado, as dívidas privadas decorrentes da bolha de especulação imobiliária, foram transferidas para a dívida pública como resultado dos resgates do sistema bancário e das respostas governamentais à desaceleração das economias no período pós-bolha. Na Grécia, os insustentáveis compromissos salariais do sector público e de pensões impulsionaram o aumento da dívida. Os problemas intensificaram-se levando os ministros das finanças europeus a aprovar a criação do Fundo Europeu de Estabilização Financeira (FEEF) e o Mecanismo Europeu de Estabilidade (MEE) mas sem grande sucesso.
<!--more-->
A crise não só gerou efeitos adversos nas economias dos países mais atingidos, como também teve impacto político significativo na governação de 8 dos 17 países da zona euro, levando a mudanças de poder na Grécia, Irlanda, Itália, Portugal, Espanha, Eslovénia, Eslováquia e Países Baixos. Todas estas medidas podem ser traduzidas em poucas palavras; injectar mais dinheiro na economia através do endividamento adicional dos governos.
Mas podemos perguntar-nos - não foi exactamente o endividamento exagerado que causou o receio entre os investidores. Esta crise veio principalmente tornar bem claro os problemas inerentes ao sistema financeiro mundial e a incapacidade das nossas instituições politicas para os resolver.
A comunidade fruga está dedicada a criar um mercado de credito mutuo directo entre os seus membros permitindo assim que estes fiquem de fora do sistema financeiro actual o mais possível. Trata-se da utilização efectiva duma moeda comunitária (frugas) para permitir a comercialização de todo o tipo de produtos e serviços entre os membros. Muitas pessoas acham que dinheiro equivale a riqueza, mas não é verdade. A criação de riqueza está nas transacções entre as pessoas. Efectivamente quando eu vendo aquilo de que não preciso estou a criar riqueza se o que vendi tiver procura efectiva.
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="259" src="http://www.youtube.com/embed/josIzTsrpJk?rel=0" width="460"></iframe>
} 
a3.save

a4 = Article.create(
  title: 'Mercado Fruga',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'mercado-fruga',
  tags: [tm]
)
a4.body_and_extended=%q{O Mercado Fruga é uma rede de comércio que permite aos participantes comprar e vender bens e serviços sem necessitar de euros mas sim moeda própria do mercado. Esta moeda está impressa em papel ou em moedas, mas sim em registos informáticos funcionando como dinheiro online. No fundo trata-se de um adiantamento feito sobre um bem ou serviço que irá ser trocado por outro bem ou serviço utilizando uma unidade digital de valor como meio facilitador da troca.
<!--more-->
Enquanto o dinheiro normalmente assume a forma de uma moeda nacional como notas de euro, existem muitos outros tipos de moedas: desde certidões simples (em que uma pessoa declara uma dívida a uma segunda pessoa num documento escrito) a programas mais sofisticados, tais como as milhas de companhias aéreas em que o dinheiro está representado em pontos que são acumulados como resultado de viagens. Outras comunidades instituem o que às vezes é chamado de moeda comunitária com notas de papel (ex: libra Totnes na cidade de Totnes, no Reino Unido). A ideia é promover o comércio local mantendo o dinheiro a circular dentro da economia local. Com o advento da Internet estas formas alternativas de comercio são mais viáveis, tendo em conta que as bases de dados electrónicas podem manter todos os registos necessários e assim facilitar a actividade comercial.
Veja como tudo isto começou à muito tempo atrás nos mercados medievais:
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="259" src="http://www.youtube.com/embed/WhO_nJ4f76g?rel=0" width="460"></iframe>
} 
a4.save

a5 = Article.create(
  title: 'Talento por amor ou por dinheiro',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'talento-amor-dinheiro',
  tags: [t1]
)
a5.body_and_extended=%q{Actualmente, usa-se o termo talento para designar habilidades inatas das pessoas, ou capacidade natural para realizar determinadas actividades. Mas nem sempre foi assim - curiosamente o talento já foi uma moeda. A conotação de talento com habilidade humana teve origem nos tempos bíblicos com a utilização duma parábola onde alguns servos recebem dinheiro em quantidades diferentes e, sem que soubessem algum tempo depois, são chamados a prestar contas do que fizeram com esse dinheiro. No fundo a parábola é utilizada para ensinar ética de trabalho comparando o dinheiro entregue aos servos com os dons que Deus entrega aos seus filhos e reforçando o dever de todos em fazer frutificar esses mesmos dons para o desenvolvimento da sua comunidade.
<!--more-->
Estudiosos actuais afirmam que, mesmo as habilidades consideradas inatas podem ser desenvolvidas caso haja motivação. Assim, qualquer pessoa está, por exemplo, potencialmente apta a aprender música, desde que tenha vontade e use as técnicas apropriadas ao estudo de música. Os mesmos estudiosos afirmam que, encontrar o nosso talento é essencial para uma vida equilibrada e também pode ajudar-nos a compreender quem realmente somos.
Actualmente tendemos a identificar-nos com o nosso trabalho - basta pensar qual é a primeira pergunta que fazemos quando acabamos de conhecer alguém em festas ou eventos sociais: "O que fazes?". Normalmente gostamos de responder com uma descrição das nossas profissões: "Eu sou um professor", "Eu sou um designer".
Se por acaso não temos um emprego remunerado, podemos até sentir uma necessidade estranha de dar uma explicação e assim evitar um desconforto social. Para muitos de nós, o trabalho ajuda a definir quem somos, até mesmo para nós próprios. Mas o que é mais estranho é isto acontecer mesmo quando esse trabalho não expressa minimamente quem realmente sentimos que somos. Isto pode ser particularmente frustrante se o nosso trabalho é insatisfatório.
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="259" src="http://www.youtube.com/embed/i5RiFLKZf7k?rel=0" width="460"></iframe>
} 
a5.save

a6 = Article.create(
  title: 'A eficiência moderna',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'eficiencia-moderna',
  tags: [t1]
)
a6.body_and_extended=%q{Actualmente, usa-se o termo talento para designar habilidades inatas das pessoas, ou capacidade natural para realizar determinadas actividades. Mas nem sempre foi assim - curiosamente o talento já foi uma moeda. A conotação de talento com habilidade humana teve origem nos tempos bíblicos com a utilização duma parábola onde alguns servos recebem dinheiro em quantidades diferentes e, sem que soubessem algum tempo depois, são chamados a prestar contas do que fizeram com esse dinheiro. No fundo a parábola é utilizada para ensinar ética de trabalho comparando o dinheiro entregue aos servos com os dons que Deus entrega aos seus filhos e reforçando o dever de todos em fazer frutificar esses mesmos dons para o desenvolvimento da sua comunidade.
<!--more-->
Estudiosos actuais afirmam que, mesmo as habilidades consideradas inatas podem ser desenvolvidas caso haja motivação. Assim, qualquer pessoa está, por exemplo, potencialmente apta a aprender música, desde que tenha vontade e use as técnicas apropriadas ao estudo de música. Os mesmos estudiosos afirmam que, encontrar o nosso talento é essencial para uma vida equilibrada e também pode ajudar-nos a compreender quem realmente somos.
Actualmente tendemos a identificar-nos com o nosso trabalho - basta pensar qual é a primeira pergunta que fazemos quando acabamos de conhecer alguém em festas ou eventos sociais: "O que fazes?". Normalmente gostamos de responder com uma descrição das nossas profissões: "Eu sou um professor", "Eu sou um designer".
Se por acaso não temos um emprego remunerado, podemos até sentir uma necessidade estranha de dar uma explicação e assim evitar um desconforto social. Para muitos de nós, o trabalho ajuda a definir quem somos, até mesmo para nós próprios. Mas o que é mais estranho é isto acontecer mesmo quando esse trabalho não expressa minimamente quem realmente sentimos que somos. Isto pode ser particularmente frustrante se o nosso trabalho é insatisfatório.
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="259" src="http://www.youtube.com/embed/i5RiFLKZf7k?rel=0" width="460"></iframe>
} 
a6.save

a7 = Article.create(
  title: 'As origens do sistema monetário actual',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'origens-sistema-monetario-actual',
  tags: [t2]
)
a7.body_and_extended=%q{O dinheiro é uma ferramenta usada na compra de bens, serviços, força de trabalho ou noutras transacções financeiras. Seu uso pode ser implícito ou explícito, livre ou por coerção. Acredita-se que a origem desta palavra em Portugal remete à moeda que já em tempos tivemos com o mesmo nome (o dinheiro).
<!--more-->
A emergência do dinheiro não depende de uma autoridade central ou governo. trata-se dum fenómeno de mercado; na prática, entretanto, os tipos de moeda mais aceites actualmente são aquelas produzidas e sancionadas pelos governos principalmente devido a imposições legais e de pagamento de impostos. Assim uma grande parte dos países possuem um padrão monetário específico - um dinheiro reconhecido oficialmente, possuindo monopólio sobre sua emissão. Algumas excepções são o euro (usado por diversos países europeus) e o dólar (utilizado em todo mundo).
O dinheiro em si é um bem escasso e por isso está na origem de tantos problemas sociais. Muitas coisas já foram usadas como dinheiro, desde metais, conchas e até cigarros ou coisas totalmente artificiais como notas bancárias. Em épocas de escassez de dinheiro as pessoas procuram formas de contornar o problema com a introdução de moedas alternativas - o importante é não perder o poder de troca e compra essenciais para o funcionamento das comunidades. Estas moedas alternativas podem complementar o dinheiro governamental: cupons, passes, recibos, cheques, vales, notas comerciais entre outros.
Na sociedade ocidental moderna o dinheiro é essencialmente um símbolo - uma abstracção normalmente electrónica ou digital que actualmente representa cerca de 97% da totalidade do dinheiro em circulação. No entanto bens como ouro e prata mantêm muitas das características essenciais do dinheiro.
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="315" src="http://www.youtube.com/embed/wP3ezMbr_QA?rel=0" width="420"></iframe>
} 
a7.save

a8 = Article.create(
  title: 'O que podemos fazer?',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'o-que-podemos-fazer',
  tags: [tc]
)
a8.body_and_extended=%q{Nos últimos 60 anos, cada vez que o sistema financeiro entrou em crise as autoridades agiram injectando dinheiro para estimular a economia. Isto criou um sistema de incentivos assimétricos, considerado por muitos especialistas como um risco moral, que encorajava uma expansão de crédito cada vez maior. Um destes especialistas foi George Soros ao considerar que este sistema foi tão bem sucedido que todos passaram a acreditar naquilo que o então presidente Reagan chamava de mágica dos mercados-livres. Ao contrario George Soros designou esta característica como sendo o fundamentalismo do mercado-livre.
<!--more-->
Os fundamentalistas acreditam que os mercados tendem a um equilíbrio natural e que os interesses das sociedades serão alcançados se cada indivíduo lutar livremente pelos seus próprios interesses esquecendo os de todos os outros. Esta é uma concepção obviamente errónea - então não foi exactamente a intervenção nos mercados e não a acção livre dos mercados, que evitou que os sistemas financeiros entrassem em colapso. Não obstante, este fundamentalismo do mercado-livre emergiu como a ideologia económica dominante desde a década de 80, quando os mercados financeiros começaram a ser globalizados, e os Estados Unidos passaram a ter um deficit na sua conta-corrente.
A globalização permitiu aos Estados Unidos sugar a poupança mundial, e consumir muito mais do que produzia, tendo o seu deficit de conta-corrente atingido 6,2% do PIB em 2006. Os mercados financeiros empurram os consumidores a pedir mais empréstimos, criando cada vez mais instrumentos sofisticados e condições favoráveis ao endividamento. As autoridades financeiras colaboram e incentivam este processo, intervindo - para injectar liquidez - cada vez que o sistema financeiro global se vê em risco.
A partir de 1980 os mercados financeiros mundiais começaram a ser desregulamentados, tendo sido a sua supervisão progressivamente relaxada até virtualmente desaparecer. A super-expansão dos empréstimos descarrilou quando os instrumentos financeiros se tornaram tão complicados que as autoridades financeiras ficaram tecnicamente incapazes de avaliar os riscos desses mesmos instrumentos financeiros, e passaram a utilizar os sistemas de gestão de riscos dos próprios bancos privados. Da mesma forma, as agências de rating internacionais usaram as informações fornecidas pelos próprios bancos sofre os instrumentos financeiros para fazer as suas analises, uma chocante abdicação da sua responsabilidade segundo considerou George Soros.
Desde que a crise se agravou e se generalizou, paralisando até o sistema de empréstimos inter-bancário mundial, muitos governos decidiram pôr de lado as suas teorias de mercado-livre e passaram a socorrer directamente e activamente os bancos privados em dificuldades. Só nos Estados Unidos logo no inicio da crise foram gastos cerca de dois triliões de dólares a tentar salvar instituições financeiras seguidas pelo maior pacote de ajuda alguma vez aprovado de setecentos biliões de dólares para socorrer os banqueiros.
Os países da UE também despenderam várias centenas de biliões de euros na tentativa de salvar bancos privados. Em Abril de 2009, o G-20, reunido em Londres, anunciou a injecção de 1 trilião dólares na economia mundial para combater a crise financeira global. George Soros, no seu livro The New Paradigm for Financial Markets (2008), diz que estamos no meio da maior crise financeira desde a Grande Depressão de 1929 e declara que, em tese, isto poderia ter sido evitado. Considera ainda que, a ideia de fundamentalismo do mercado-livre, que hoje é a ideologia dominante, e que pressupõe que os mercados se corrigem a si mesmo; é completamente falsa porque geralmente é a intervenção das autoridades que salvam os mercados à custa dos contribuintes. Desde 1980 tivemos cinco ou seis crises financeiras: a crise bancária internacional de 1982, a falência do banco Continental Illinois em 1984 e a falência do Long-Term Capital Management, em 1998, só para citar três. De todas as vezes, foram as autoridades que salvaram os mercados, ou organizaram empresas para o fazer.
No entanto, de alguma forma, a ideia de que os mercados tendem ao equilíbrio por si e que os seus desvios são aleatórios ganhou aceitação geral e todos estes instrumentos financeiros sofisticados foram baseados nesta aceitação. Mas é possível viver de outra forma, veja como:
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="259" src="http://www.youtube.com/embed/flL9Q9MoGwM?rel=0" width="460"></iframe>
} 
a8.save

a9 = Article.create(
  title: 'Sistema Financeiro Mundial',
  author: fr.login,
  user: fr,
  allow_comments: 1,
  allow_pings: 0,
  published: 1,
  permalink: 'sistema-financeiro-mundial',
  tags: [t2]
)
a9.body_and_extended=%q{O sistema financeiro mundial antes de 1944 utilizava o ouro como padrão contra o qual as outras moedas eram indexadas. Assim as notas de papel, eram teoricamente convertíveis em ouro caso fosse feito um pedido junto dum banco. Uma alternativa histórica que foi rejeitada no século XX foi o "duplo padrão", em que o ouro e a prata eram usados para indexar as moedas.
<!--more-->
No fim da segunda guerra mundial, os países aliados decidiram implantar um sistema mais liberalista, e é neste contexto que se desenvolveu o Sistema de Bretton Woods, composto pelo Fundo Monetário Internacional (FMI), o Banco Internacional para Reconstrução e Desenvolvimento (BIRD) e a Organização Internacional do Comércio (OIC). Neste novo sistema os Estados Unidos deveriam manter a conversibilidade de 35 dólares numa onça de ouro - é por isto que este sistema também ficou conhecido como "padrão dólar-ouro" e foi mantido até 1971 quando os EUA anunciaram já não iriam manter a conversibilidade de dólares em ouro.
Nasceu assim o sistema financeiro actual que utiliza moeda fiduciária, cujo valor é definido por decreto governamental envolvendo um banco central. Normalmente este dinheiro é papel-moeda, mas também pode ser simplesmente registos digitais como saldos bancários e registos de crédito, débito ou operações com cartão.
<br/><br/>
<iframe allowfullscreen="" frameborder="0" height="345" src="http://www.youtube.com/embed/PpjNoVRTjwY?rel=0" width="460"></iframe>
} 
a9.save

p1=Page.create(name: "apresentacao", 
  permalink: 'apresentacao',
  published: 1, 
  published_at: Time.now,
  title: 'Apresentação', 
  user: fr, 
  body: %q{Na comunidade fruga estamos dedicados a viver de forma consciente e deliberada sorvendo toda a essência da vida afim de derrotar tudo o que é não-viver.
Estamos dedicados a facilitar a conquista mais importante do ser humano - separar consciência e pensamentos.
Perceber que não somos os nossos pensamentos, que somos aquilo que observa esses pensamentos.
Reconhecer que as principais causas do sofrimento humano raramente são as situações que acontecem, mas sim os nossos pensamentos sobre essas situações.
Na comunidade fruga estamos concentrados em simplificar, criando novas formas de fazer as coisas, compartilhando ideias para melhorar a nossa felicidade.
Estamos ainda dedicados a criar um mercado de credito mutuo directo entre os nossos membros permitindo assim uma maior concentração na comunidade e nos seus objectivos esquecendo uma das maiores preocupações actuais - o problemas económicos e financeiros:
<br/><br/>
<iframe allowfullscreen='' frameborder='0' height='259' width='460' src='http://www.youtube.com/embed/NmFnwkwbjiI?rel=0'></iframe>
} 
)

Dir.mkdir("#{::Rails.root.to_s}/public/files") unless File.directory?("#{::Rails.root.to_s}/public/files")