# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Spree::Core::Engine.load_seed if defined?(Spree::Core)
#Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

#Formas de pagamento
#Spree::PaymentMethod.delete_all
#Spree::Preference.where("key like '/spree/gateway/pay_pal_express%'").delete_all
pm1=Spree::PaymentMethod::Check.find_or_create_by!(name: "Loja", environment: Rails.env) { |u| u.description="Pagamento feito na loja fruga"; u.active=true }
pm2=Spree::Gateway::PayPalExpress.find_or_create_by!(name: "Paypal Express", environment: Rails.env) { |u| u.description="Pagamento feito com Paypal Express"; u.active=true }
if Rails.env == "productionnothet"
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/login/" + pm2.id.to_s) { |u| u.value=ENV['PAYPAL_LOGIN']; u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/password/" + pm2.id.to_s) { |u| u.value=ENV['PAYPAL_PASSWORD']; u.value_type="password" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/signature/" + pm2.id.to_s) { |u| u.value=ENV['PAYPAL_SIGNATURE']; u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/server/" + pm2.id.to_s) { |u| u.value="live"; u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/test_mode/" + pm2.id.to_s) { |u| u.value=false; u.value_type="boolean" }
else
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/login/" + pm2.id.to_s) { |u| u.value=ENV['PAYPAL_SANDBOX_LOGIN']; u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/password/" + pm2.id.to_s) { |u| u.value=ENV['PAYPAL_SANDBOX_PASSWORD']; u.value_type="password" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/signature/" + pm2.id.to_s) { |u| u.value=ENV['PAYPAL_SANDBOX_SIGNATURE']; u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/server/" + pm2.id.to_s) { |u| u.value="sandbox"; u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/gateway/pay_pal_express/test_mode/" + pm2.id.to_s) { |u| u.value=true; u.value_type="boolean" }
end

#For sessions using social
#Spree::AuthenticationMethod.delete_all
Spree::AuthenticationMethod.find_or_create_by!(provider: "facebook", environment: Rails.env) { |u| u.api_key=ENV['FB_API_KEY']; u.api_secret=ENV['FB_API_SECRET']; u.active=true }
Spree::AuthenticationMethod.find_or_create_by!(provider: "twitter", environment: Rails.env) { |u| u.api_key=ENV['TW_API_KEY']; u.api_secret=ENV['TW_API_SECRET']; u.active=true }
Spree::AuthenticationMethod.find_or_create_by!(provider: "google_oauth2", environment: Rails.env) { |u| u.api_key=ENV['GP_API_KEY']; u.api_secret=ENV['GP_API_SECRET']; u.active=true }

# Analytics tracker for Mercado Fruga Portugal
#Spree::Tracker.delete_all
Spree::Tracker.find_or_create_by!(environment: "production") { |u| u.analytics_id="UA-38353037-4" }

#Zonas PT/NUTS-I/NUTS-II/NUTS-III/distritos/concelhos
Spree::ZoneMember.delete_all
Spree::Zone.delete_all

#Concelhos
Spree::Country.delete_all
pt=Spree::Country.find_or_create_by!(name: "Portugal") { |u| u.iso3="PRT"; u.iso="PT"; u.iso_name="PORTUGAL"; u.numcode="620";u.states_required=true }
Spree::Config[:default_country_id] = pt.id

#pt = Spree::Country.find_by_name("Portugal")
Spree::State.delete_all
c0101=pt.states.create(name: "Águeda",abbr: 'AGD')
c0102=pt.states.create(name: "Albergaria-a-Velha",abbr: 'ALB')
c0103=pt.states.create(name: "Anadia",abbr: 'AND')
c0104=pt.states.create(name: "Arouca",abbr: 'ARC')
c0105=pt.states.create(name: "Aveiro",abbr: 'AVR')
c0106=pt.states.create(name: "Castelo de Paiva",abbr: 'CPV')
c0107=pt.states.create(name: "Espinho",abbr: 'ESP')
c0108=pt.states.create(name: "Estarreja",abbr: 'ETR')
c0110=pt.states.create(name: "Ílhavo",abbr: 'ILH')
c0111=pt.states.create(name: "Mealhada",abbr: 'MLD')
c0112=pt.states.create(name: "Murtosa",abbr: 'MRS')
c0113=pt.states.create(name: "Oliveira de Azeméis",abbr: 'OAZ')
c0114=pt.states.create(name: "Oliveira do Bairro",abbr: 'OBR')
c0115=pt.states.create(name: "Ovar",abbr: 'OVR')
c0109=pt.states.create(name: "Santa Maria da Feira",abbr: 'VFR')
c0116=pt.states.create(name: "São João da Madeira",abbr: 'SJM')
c0117=pt.states.create(name: "Sever do Vouga",abbr: 'SVV')
c0118=pt.states.create(name: "Vagos",abbr: 'VGS')
c0119=pt.states.create(name: "Vale de Cambra",abbr: 'VAC')
c0201=pt.states.create(name: "Aljustrel",abbr: 'AJT')
c0202=pt.states.create(name: "Almodôvar",abbr: 'ADV')
c0203=pt.states.create(name: "Alvito",abbr: 'AVT')
c0204=pt.states.create(name: "Barrancos",abbr: 'BRC')
c0205=pt.states.create(name: "Beja",abbr: 'BJA')
c0206=pt.states.create(name: "Castro Verde",abbr: 'CVR')
c0207=pt.states.create(name: "Cuba",abbr: 'CBA')
c0208=pt.states.create(name: "Ferreira do Alentejo",abbr: 'FAL')
c0209=pt.states.create(name: "Mértola",abbr: 'MTL')
c0210=pt.states.create(name: "Moura",abbr: 'MRA')
c0211=pt.states.create(name: "Odemira",abbr: 'ODM')
c0212=pt.states.create(name: "Ourique",abbr: 'ORQ')
c0213=pt.states.create(name: "Serpa",abbr: 'SRP')
c0214=pt.states.create(name: "Vidigueira",abbr: 'VDG')
c0301=pt.states.create(name: "Amares",abbr: 'AMR')
c0302=pt.states.create(name: "Barcelos",abbr: 'BCL')
c0303=pt.states.create(name: "Braga",abbr: 'BRG')
c0304=pt.states.create(name: "Cabeceiras de Basto",abbr: 'CBC')
c0305=pt.states.create(name: "Celorico de Basto",abbr: 'CBT')
c0306=pt.states.create(name: "Esposende",abbr: 'EPS')
c0307=pt.states.create(name: "Fafe",abbr: 'FAF')
c0308=pt.states.create(name: "Guimarães",abbr: 'GMR')
c0309=pt.states.create(name: "Póvoa de Lanhoso",abbr: 'PVL')
c0310=pt.states.create(name: "Terras de Bouro",abbr: 'TBR')
c0311=pt.states.create(name: "Vieira do Minho",abbr: 'VRM')
c0312=pt.states.create(name: "Vila Nova de Famalicão",abbr: 'VNF')
c0313=pt.states.create(name: "Vila Verde",abbr: 'VVD')
c0314=pt.states.create(name: "Vizela",abbr: 'VIZ')
c0401=pt.states.create(name: "Alfândega da Fé",abbr: 'AFE')
c0402=pt.states.create(name: "Bragança",abbr: 'BGC')
c0403=pt.states.create(name: "Carrazeda de Ansiães",abbr: 'CRZ')
c0404=pt.states.create(name: "Freixo de Espada à Cinta",abbr: 'FEC')
c0405=pt.states.create(name: "Macedo de Cavaleiros",abbr: 'MCD')
c0406=pt.states.create(name: "Miranda do Douro",abbr: 'MDR')
c0407=pt.states.create(name: "Mirandela",abbr: 'MDL')
c0408=pt.states.create(name: "Mogadouro",abbr: 'MGD')
c0409=pt.states.create(name: "Torre de Moncorvo",abbr: 'TMC')
c0410=pt.states.create(name: "Vila Flor",abbr: 'VFL')
c0411=pt.states.create(name: "Vimioso",abbr: 'VMS')
c0412=pt.states.create(name: "Vinhais",abbr: 'VNH')
c0501=pt.states.create(name: "Belmonte",abbr: 'BMT')
c0502=pt.states.create(name: "Castelo Branco",abbr: 'CTB')
c0503=pt.states.create(name: "Covilhã",abbr: 'CVL')
c0504=pt.states.create(name: "Fundão",abbr: 'FND')
c0505=pt.states.create(name: "Idanha-a-Nova",abbr: 'IDN')
c0506=pt.states.create(name: "Oleiros",abbr: 'OLR')
c0507=pt.states.create(name: "Penamacor",abbr: 'PNC')
c0508=pt.states.create(name: "Proença-a-Nova",abbr: 'PNV')
c0509=pt.states.create(name: "Sertã",abbr: 'SRT')
c0510=pt.states.create(name: "Vila de Rei",abbr: 'VLR')
c0511=pt.states.create(name: "Vila Velha de Ródão",abbr: 'VVR')
c0601=pt.states.create(name: "Arganil",abbr: 'AGN')
c0602=pt.states.create(name: "Cantanhede",abbr: 'CNT')
c0603=pt.states.create(name: "Coimbra",abbr: 'CBR')
c0604=pt.states.create(name: "Condeixa-a-Nova",abbr: 'CDN')
c0605=pt.states.create(name: "Figueira da Foz",abbr: 'FIG')
c0606=pt.states.create(name: "Góis",abbr: 'GOI')
c0607=pt.states.create(name: "Lousã",abbr: 'LSA')
c0608=pt.states.create(name: "Mira",abbr: 'MIR')
c0609=pt.states.create(name: "Miranda do Corvo",abbr: 'MCV')
c0610=pt.states.create(name: "Montemor-o-Velho",abbr: 'MMV')
c0611=pt.states.create(name: "Oliveira do Hospital",abbr: 'OHP')
c0612=pt.states.create(name: "Pampilhosa da Serra",abbr: 'PPS')
c0613=pt.states.create(name: "Penacova",abbr: 'PCV')
c0614=pt.states.create(name: "Penela",abbr: 'PNL')
c0615=pt.states.create(name: "Soure",abbr: 'SRE')
c0616=pt.states.create(name: "Tábua",abbr: 'TBU')
c0617=pt.states.create(name: "Vila Nova de Poiares",abbr: 'PRS')
c0701=pt.states.create(name: "Alandroal",abbr: 'ADL')
c0702=pt.states.create(name: "Arraiolos",abbr: 'ARL')
c0703=pt.states.create(name: "Borba",abbr: 'BRB')
c0704=pt.states.create(name: "Estremoz",abbr: 'ETZ')
c0705=pt.states.create(name: "Évora",abbr: 'EVR')
c0706=pt.states.create(name: "Montemor-o-Novo",abbr: 'MMN')
c0707=pt.states.create(name: "Mora",abbr: 'MOR')
c0708=pt.states.create(name: "Mourão",abbr: 'MOU')
c0709=pt.states.create(name: "Portel",abbr: 'PRL')
c0710=pt.states.create(name: "Redondo",abbr: 'RDD')
c0711=pt.states.create(name: "Reguengos de Monsaraz",abbr: 'RMZ')
c0712=pt.states.create(name: "Vendas Novas",abbr: 'VND')
c0713=pt.states.create(name: "Viana do Alentejo",abbr: 'VNT')
c0714=pt.states.create(name: "Vila Viçosa",abbr: 'VVC')
c0801=pt.states.create(name: "Albufeira",abbr: 'ABF')
c0802=pt.states.create(name: "Alcoutim",abbr: 'ACT')
c0803=pt.states.create(name: "Aljezur",abbr: 'AJZ')
c0804=pt.states.create(name: "Castro Marim",abbr: 'CTM')
c0805=pt.states.create(name: "Faro",abbr: 'FAR')
c0806=pt.states.create(name: "Lagoa - Algarve",abbr: 'LAG')
c0807=pt.states.create(name: "Lagos",abbr: 'LGS')
c0808=pt.states.create(name: "Loulé",abbr: 'LLE')
c0809=pt.states.create(name: "Monchique",abbr: 'MCQ')
c0810=pt.states.create(name: "Olhão",abbr: 'OLH')
c0811=pt.states.create(name: "Portimão",abbr: 'PTM')
c0812=pt.states.create(name: "São Brás de Alportel",abbr: 'SBA')
c0813=pt.states.create(name: "Silves",abbr: 'SLV')
c0814=pt.states.create(name: "Tavira",abbr: 'TVR')
c0815=pt.states.create(name: "Vila do Bispo",abbr: 'VBP')
c0816=pt.states.create(name: "Vila Real de Santo António",abbr: 'VRS')
c0901=pt.states.create(name: "Aguiar da Beira",abbr: 'AGB')
c0902=pt.states.create(name: "Almeida",abbr: 'ALD')
c0903=pt.states.create(name: "Celorico da Beira",abbr: 'CLB')
c0904=pt.states.create(name: "Figueira de Castelo Rodrigo",abbr: 'FCR')
c0905=pt.states.create(name: "Fornos de Algodres",abbr: 'FAG')
c0906=pt.states.create(name: "Gouveia",abbr: 'GVA')
c0907=pt.states.create(name: "Guarda",abbr: 'GRD')
c0908=pt.states.create(name: "Manteigas",abbr: 'MTG')
c0909=pt.states.create(name: "Meda",abbr: 'MED')
c0910=pt.states.create(name: "Pinhel",abbr: 'PNH')
c0911=pt.states.create(name: "Sabugal",abbr: 'SBG')
c0912=pt.states.create(name: "Seia",abbr: 'SEI')
c0913=pt.states.create(name: "Trancoso",abbr: 'TCS')
c0914=pt.states.create(name: "Vila Nova de Foz Côa",abbr: 'VLF')
c1001=pt.states.create(name: "Alcobaça",abbr: 'ACB')
c1002=pt.states.create(name: "Alvaiázere",abbr: 'AVZ')
c1003=pt.states.create(name: "Ansião",abbr: 'ANS')
c1004=pt.states.create(name: "Batalha",abbr: 'BTL')
c1005=pt.states.create(name: "Bombarral",abbr: 'BBR')
c1006=pt.states.create(name: "Caldas da Rainha",abbr: 'CLD')
c1007=pt.states.create(name: "Castanheira de Pêra",abbr: 'CPR')
c1008=pt.states.create(name: "Figueiró dos Vinhos",abbr: 'FVN')
c1009=pt.states.create(name: "Leiria",abbr: 'LRA')
c1010=pt.states.create(name: "Marinha Grande",abbr: 'MGR')
c1011=pt.states.create(name: "Nazaré",abbr: 'NZR')
c1012=pt.states.create(name: "Óbidos",abbr: 'OBD')
c1013=pt.states.create(name: "Pedrógão Grande",abbr: 'PGR')
c1014=pt.states.create(name: "Peniche",abbr: 'PNI')
c1015=pt.states.create(name: "Pombal",abbr: 'PBL')
c1016=pt.states.create(name: "Porto de Mós",abbr: 'PMS')
c1101=pt.states.create(name: "Alenquer",abbr: 'ALQ')
c1115=pt.states.create(name: "Amadora",abbr: 'AMD')
c1102=pt.states.create(name: "Arruda dos Vinhos",abbr: 'ARV')
c1103=pt.states.create(name: "Azambuja",abbr: 'AZB')
c1104=pt.states.create(name: "Cadaval",abbr: 'CDV')
c1105=pt.states.create(name: "Cascais",abbr: 'CSC')
c1106=pt.states.create(name: "Lisboa",abbr: 'LSB')
c1107=pt.states.create(name: "Loures",abbr: 'LRS')
c1108=pt.states.create(name: "Lourinhã",abbr: 'LNH')
c1109=pt.states.create(name: "Mafra",abbr: 'MFR')
c1116=pt.states.create(name: "Odivelas",abbr: 'ODV')
c1110=pt.states.create(name: "Oeiras",abbr: 'OER')
c1111=pt.states.create(name: "Sintra",abbr: 'SNT')
c1112=pt.states.create(name: "Sobral de Monte Agraço",abbr: 'SMA')
c1113=pt.states.create(name: "Torres Vedras",abbr: 'TVD')
c1114=pt.states.create(name: "Vila Franca de Xira",abbr: 'VFX')
c1201=pt.states.create(name: "Alter do Chão",abbr: 'ALT')
c1202=pt.states.create(name: "Arronches",abbr: 'ARR')
c1203=pt.states.create(name: "Avis",abbr: 'AVS')
c1204=pt.states.create(name: "Campo Maior",abbr: 'CMR')
c1205=pt.states.create(name: "Castelo de Vide",abbr: 'CVD')
c1206=pt.states.create(name: "Crato",abbr: 'CRT')
c1207=pt.states.create(name: "Elvas",abbr: 'ELV')
c1208=pt.states.create(name: "Fronteira",abbr: 'FTR')
c1209=pt.states.create(name: "Gavião",abbr: 'GAV')
c1210=pt.states.create(name: "Marvão",abbr: 'MRV')
c1211=pt.states.create(name: "Monforte",abbr: 'MFT')
c1212=pt.states.create(name: "Nisa",abbr: 'NIS')
c1213=pt.states.create(name: "Ponte de Sor",abbr: 'PSR')
c1214=pt.states.create(name: "Portalegre",abbr: 'PTG')
c1215=pt.states.create(name: "Sousel",abbr: 'SSL')
c1301=pt.states.create(name: "Amarante",abbr: 'AMT')
c1302=pt.states.create(name: "Baião",abbr: 'BAO')
c1303=pt.states.create(name: "Felgueiras",abbr: 'FLG')
c1304=pt.states.create(name: "Gondomar",abbr: 'GDM')
c1305=pt.states.create(name: "Lousada",abbr: 'LOU')
c1306=pt.states.create(name: "Maia",abbr: 'MAI')
c1307=pt.states.create(name: "Marco de Canaveses",abbr: 'MCN')
c1308=pt.states.create(name: "Matosinhos",abbr: 'MTS')
c1309=pt.states.create(name: "Paços de Ferreira",abbr: 'PFR')
c1310=pt.states.create(name: "Paredes",abbr: 'PRD')
c1311=pt.states.create(name: "Penafiel",abbr: 'PNF')
c1312=pt.states.create(name: "Porto",abbr: 'PRT')
c1313=pt.states.create(name: "Póvoa de Varzim",abbr: 'PVZ')
c1314=pt.states.create(name: "Santo Tirso",abbr: 'STS')
c1318=pt.states.create(name: "Trofa",abbr: 'TRF')
c1315=pt.states.create(name: "Valongo",abbr: 'VLG')
c1316=pt.states.create(name: "Vila do Conde",abbr: 'VCD')
c1317=pt.states.create(name: "Vila Nova de Gaia",abbr: 'VNG')
c1401=pt.states.create(name: "Abrantes",abbr: 'ABT')
c1402=pt.states.create(name: "Alcanena",abbr: 'ACN')
c1403=pt.states.create(name: "Almeirim",abbr: 'ALR')
c1404=pt.states.create(name: "Alpiarça",abbr: 'APC')
c1405=pt.states.create(name: "Benavente",abbr: 'BNV')
c1406=pt.states.create(name: "Cartaxo",abbr: 'CTX')
c1407=pt.states.create(name: "Chamusca",abbr: 'CHM')
c1408=pt.states.create(name: "Constância",abbr: 'CNS')
c1409=pt.states.create(name: "Coruche",abbr: 'CCH')
c1410=pt.states.create(name: "Entroncamento",abbr: 'ENT')
c1411=pt.states.create(name: "Ferreira do Zêzere",abbr: 'FZZ')
c1412=pt.states.create(name: "Golegã",abbr: 'GLG')
c1413=pt.states.create(name: "Mação",abbr: 'MAC')
c1421=pt.states.create(name: "Ourém",abbr: 'ORM')
c1414=pt.states.create(name: "Rio Maior",abbr: 'RMR')
c1415=pt.states.create(name: "Salvaterra de Magos",abbr: 'SMG')
c1416=pt.states.create(name: "Santarém",abbr: 'STR')
c1417=pt.states.create(name: "Sardoal",abbr: 'SRD')
c1418=pt.states.create(name: "Tomar",abbr: 'TMR')
c1419=pt.states.create(name: "Torres Novas",abbr: 'TNV')
c1420=pt.states.create(name: "Vila Nova da Barquinha",abbr: 'VNB')
c1501=pt.states.create(name: "Alcácer do Sal",abbr: 'ASL')
c1502=pt.states.create(name: "Alcochete",abbr: 'ACH')
c1503=pt.states.create(name: "Almada",abbr: 'ALM')
c1504=pt.states.create(name: "Barreiro",abbr: 'BRR')
c1505=pt.states.create(name: "Grândola",abbr: 'GDL')
c1506=pt.states.create(name: "Moita",abbr: 'MTA')
c1507=pt.states.create(name: "Montijo",abbr: 'MTJ')
c1508=pt.states.create(name: "Palmela",abbr: 'PLM')
c1509=pt.states.create(name: "Santiago do Cacém",abbr: 'STC')
c1510=pt.states.create(name: "Seixal",abbr: 'SXL')
c1511=pt.states.create(name: "Sesimbra",abbr: 'SSB')
c1512=pt.states.create(name: "Setúbal",abbr: 'STB')
c1513=pt.states.create(name: "Sines",abbr: 'SNS')
c1601=pt.states.create(name: "Arcos de Valdevez",abbr: 'AVV')
c1602=pt.states.create(name: "Caminha",abbr: 'CMN')
c1603=pt.states.create(name: "Melgaço",abbr: 'MLG')
c1604=pt.states.create(name: "Monção",abbr: 'MNC')
c1605=pt.states.create(name: "Paredes de Coura",abbr: 'PCR')
c1606=pt.states.create(name: "Ponte da Barca",abbr: 'PTB')
c1607=pt.states.create(name: "Ponte de Lima",abbr: 'PTL')
c1608=pt.states.create(name: "Valença",abbr: 'VLC')
c1609=pt.states.create(name: "Viana do Castelo",abbr: 'VCT')
c1610=pt.states.create(name: "Vila Nova de Cerveira",abbr: 'VNC')
c1701=pt.states.create(name: "Alijó",abbr: 'ALJ')
c1702=pt.states.create(name: "Boticas",abbr: 'BTC')
c1703=pt.states.create(name: "Chaves",abbr: 'CHV')
c1704=pt.states.create(name: "Mesão Frio",abbr: 'MSF')
c1705=pt.states.create(name: "Mondim de Basto",abbr: 'MDB')
c1706=pt.states.create(name: "Montalegre",abbr: 'MTR')
c1707=pt.states.create(name: "Murça",abbr: 'MUR')
c1708=pt.states.create(name: "Peso da Régua",abbr: 'PRG')
c1709=pt.states.create(name: "Ribeira de Pena",abbr: 'RPN')
c1710=pt.states.create(name: "Sabrosa",abbr: 'SBS')
c1711=pt.states.create(name: "Santa Marta de Penaguião",abbr: 'SMP')
c1712=pt.states.create(name: "Valpaços",abbr: 'VPC')
c1713=pt.states.create(name: "Vila Pouca de Aguiar",abbr: 'VPA')
c1714=pt.states.create(name: "Vila Real",abbr: 'VRL')
c1801=pt.states.create(name: "Armamar",abbr: 'AMM')
c1802=pt.states.create(name: "Carregal do Sal",abbr: 'CRS')
c1803=pt.states.create(name: "Castro Daire",abbr: 'CDR')
c1804=pt.states.create(name: "Cinfães",abbr: 'CNF')
c1805=pt.states.create(name: "Lamego",abbr: 'LMG')
c1806=pt.states.create(name: "Mangualde",abbr: 'MGL')
c1807=pt.states.create(name: "Moimenta da Beira",abbr: 'MBR')
c1808=pt.states.create(name: "Mortágua",abbr: 'MRT')
c1809=pt.states.create(name: "Nelas",abbr: 'NLS')
c1810=pt.states.create(name: "Oliveira de Frades",abbr: 'OFR')
c1811=pt.states.create(name: "Penalva do Castelo",abbr: 'PCT')
c1812=pt.states.create(name: "Penedono",abbr: 'PND')
c1813=pt.states.create(name: "Resende",abbr: 'RSD')
c1814=pt.states.create(name: "Santa Comba Dão",abbr: 'SCD')
c1815=pt.states.create(name: "São João da Pesqueira",abbr: 'SJP')
c1816=pt.states.create(name: "São Pedro do Sul",abbr: 'SPS')
c1817=pt.states.create(name: "Sátão",abbr: 'SAT')
c1818=pt.states.create(name: "Sernancelhe",abbr: 'SRN')
c1819=pt.states.create(name: "Tabuaço",abbr: 'TBC')
c1820=pt.states.create(name: "Tarouca",abbr: 'TRC')
c1821=pt.states.create(name: "Tondela",abbr: 'TND')
c1822=pt.states.create(name: "Vila Nova de Paiva",abbr: 'VNP')
c1823=pt.states.create(name: "Viseu",abbr: 'VIS')
c1824=pt.states.create(name: "Vouzela",abbr: 'VZL')
c3101=pt.states.create(name: "Calheta - Madeira",abbr: 'CHT')
c3102=pt.states.create(name: "Câmara de Lobos",abbr: 'CML')
c3103=pt.states.create(name: "Funchal",abbr: 'FNC')
c3104=pt.states.create(name: "Machico",abbr: 'MCH')
c3105=pt.states.create(name: "Ponta do Sol",abbr: 'PTS')
c3106=pt.states.create(name: "Porto Moniz",abbr: 'PMZ')
c3107=pt.states.create(name: "Ribeira Brava",abbr: 'RBR')
c3108=pt.states.create(name: "Santa Cruz",abbr: 'SCR')
c3109=pt.states.create(name: "Santana",abbr: 'STN')
c3110=pt.states.create(name: "São Vicente",abbr: 'SVC')
c3201=pt.states.create(name: "Porto Santo",abbr: 'PST')
c4101=pt.states.create(name: "Vila do Porto",abbr: 'VPT')
c4201=pt.states.create(name: "Lagoa - São Miguel",abbr: 'LGA')
c4202=pt.states.create(name: "Nordeste",abbr: 'NRD')
c4203=pt.states.create(name: "Ponta Delgada",abbr: 'PDL')
c4204=pt.states.create(name: "Povoação",abbr: 'PVC')
c4205=pt.states.create(name: "Ribeira Grande",abbr: 'RGR')
c4206=pt.states.create(name: "Vila Franca do Campo",abbr: 'VFC')
c4301=pt.states.create(name: "Angra do Heroísmo",abbr: 'AGH')
c4302=pt.states.create(name: "Praia da Vitória",abbr: 'VPV')
c4401=pt.states.create(name: "Santa Cruz da Graciosa",abbr: 'SCG')
c4501=pt.states.create(name: "Calheta - São Jorge",abbr: 'CLT')
c4502=pt.states.create(name: "Velas",abbr: 'VLS')
c4601=pt.states.create(name: "Lajes do Pico",abbr: 'LGP')
c4602=pt.states.create(name: "Madalena",abbr: 'MAD')
c4603=pt.states.create(name: "São Roque do Pico",abbr: 'SRQ')
c4701=pt.states.create(name: "Horta",abbr: 'HRT')
c4801=pt.states.create(name: "Lajes das Flores",abbr: 'LGF')
c4802=pt.states.create(name: "Santa Cruz das Flores",abbr: 'SCF')
c4901=pt.states.create(name: "Corvo",abbr: 'CRV')


ctt1=Spree::Zone.create(name: 'CTT T1', description: 'Zona CTT que apanha Códigos postais iniciados por 1-5', default_tax: true)
ctt2=Spree::Zone.create(name: 'CTT T2', description: 'Zona CTT que apanha Códigos postais iniciados por 6-8')
cam=Spree::Zone.create(name: 'CTT CAM', description: 'Zona CTT que apanha Códigos postais iniciados por 9 (Ilhas)')
ctt1.members.create(zoneable: c1106)
ctt1.members.create(zoneable: c1116)
ctt1.members.create(zoneable: c1110)
ctt1.members.create(zoneable: c1001)
ctt1.members.create(zoneable: c1004)
ctt1.members.create(zoneable: c1005)
ctt1.members.create(zoneable: c1006)
ctt1.members.create(zoneable: c1009)
ctt1.members.create(zoneable: c1010)
ctt1.members.create(zoneable: c1011)
ctt1.members.create(zoneable: c1012)
ctt1.members.create(zoneable: c1014)
ctt1.members.create(zoneable: c1016)
ctt1.members.create(zoneable: c1101)
ctt1.members.create(zoneable: c1115)
ctt1.members.create(zoneable: c1102)
ctt1.members.create(zoneable: c1103)
ctt1.members.create(zoneable: c1104)
ctt1.members.create(zoneable: c1105)
ctt1.members.create(zoneable: c1107)
ctt1.members.create(zoneable: c1108)
ctt1.members.create(zoneable: c1109)
ctt1.members.create(zoneable: c1111)
ctt1.members.create(zoneable: c1112)
ctt1.members.create(zoneable: c1113)
ctt1.members.create(zoneable: c1114)
ctt1.members.create(zoneable: c1401)
ctt1.members.create(zoneable: c1402)
ctt1.members.create(zoneable: c1403)
ctt1.members.create(zoneable: c1404)
ctt1.members.create(zoneable: c1405)
ctt1.members.create(zoneable: c1406)
ctt1.members.create(zoneable: c1407)
ctt1.members.create(zoneable: c1408)
ctt1.members.create(zoneable: c1409)
ctt1.members.create(zoneable: c1410)
ctt1.members.create(zoneable: c1411)
ctt1.members.create(zoneable: c1412)
ctt1.members.create(zoneable: c1421)
ctt1.members.create(zoneable: c1414)
ctt1.members.create(zoneable: c1415)
ctt1.members.create(zoneable: c1416)
ctt1.members.create(zoneable: c1417)
ctt1.members.create(zoneable: c1418)
ctt1.members.create(zoneable: c1419)
ctt1.members.create(zoneable: c1420)
ctt1.members.create(zoneable: c1502)
ctt1.members.create(zoneable: c1503)
ctt1.members.create(zoneable: c1504)
ctt1.members.create(zoneable: c1506)
ctt1.members.create(zoneable: c1507)
ctt1.members.create(zoneable: c1508)
ctt1.members.create(zoneable: c1510)
ctt1.members.create(zoneable: c1511)
ctt1.members.create(zoneable: c1512)
ctt1.members.create(zoneable: c0101)
ctt1.members.create(zoneable: c0102)
ctt1.members.create(zoneable: c0103)
ctt1.members.create(zoneable: c0105)
ctt1.members.create(zoneable: c0108)
ctt1.members.create(zoneable: c0110)
ctt1.members.create(zoneable: c0111)
ctt1.members.create(zoneable: c0112)
ctt1.members.create(zoneable: c0113)
ctt1.members.create(zoneable: c0114)
ctt1.members.create(zoneable: c0115)
ctt1.members.create(zoneable: c0116)
ctt1.members.create(zoneable: c0117)
ctt1.members.create(zoneable: c0118)
ctt1.members.create(zoneable: c0119)
ctt1.members.create(zoneable: c0601)
ctt1.members.create(zoneable: c0602)
ctt1.members.create(zoneable: c0603)
ctt1.members.create(zoneable: c0604)
ctt1.members.create(zoneable: c0605)
ctt1.members.create(zoneable: c0606)
ctt1.members.create(zoneable: c0607)
ctt1.members.create(zoneable: c0608)
ctt1.members.create(zoneable: c0609)
ctt1.members.create(zoneable: c0610)
ctt1.members.create(zoneable: c0611)
ctt1.members.create(zoneable: c0612)
ctt1.members.create(zoneable: c0613)
ctt1.members.create(zoneable: c0614)
ctt1.members.create(zoneable: c0615)
ctt1.members.create(zoneable: c0616)
ctt1.members.create(zoneable: c0617)
ctt1.members.create(zoneable: c0901)
ctt1.members.create(zoneable: c1002)
ctt1.members.create(zoneable: c1003)
ctt1.members.create(zoneable: c1007)
ctt1.members.create(zoneable: c1008)
ctt1.members.create(zoneable: c1013)
ctt1.members.create(zoneable: c1015)
ctt1.members.create(zoneable: c1802)
ctt1.members.create(zoneable: c1803)
ctt1.members.create(zoneable: c1806)
ctt1.members.create(zoneable: c1807)
ctt1.members.create(zoneable: c1808)
ctt1.members.create(zoneable: c1809)
ctt1.members.create(zoneable: c1810)
ctt1.members.create(zoneable: c1811)
ctt1.members.create(zoneable: c1812)
ctt1.members.create(zoneable: c1814)
ctt1.members.create(zoneable: c1816)
ctt1.members.create(zoneable: c1817)
ctt1.members.create(zoneable: c1818)
ctt1.members.create(zoneable: c1820)
ctt1.members.create(zoneable: c1821)
ctt1.members.create(zoneable: c1822)
ctt1.members.create(zoneable: c1823)
ctt1.members.create(zoneable: c1824)
ctt1.members.create(zoneable: c0104)
ctt1.members.create(zoneable: c0106)
ctt1.members.create(zoneable: c0107)
ctt1.members.create(zoneable: c0109)
ctt1.members.create(zoneable: c0301)
ctt1.members.create(zoneable: c0302)
ctt1.members.create(zoneable: c0303)
ctt1.members.create(zoneable: c0304)
ctt1.members.create(zoneable: c0305)
ctt1.members.create(zoneable: c0306)
ctt1.members.create(zoneable: c0307)
ctt1.members.create(zoneable: c0308)
ctt1.members.create(zoneable: c0309)
ctt1.members.create(zoneable: c0310)
ctt1.members.create(zoneable: c0311)
ctt1.members.create(zoneable: c0312)
ctt1.members.create(zoneable: c0313)
ctt1.members.create(zoneable: c0314)
ctt1.members.create(zoneable: c1301)
ctt1.members.create(zoneable: c1302)
ctt1.members.create(zoneable: c1303)
ctt1.members.create(zoneable: c1304)
ctt1.members.create(zoneable: c1305)
ctt1.members.create(zoneable: c1306)
ctt1.members.create(zoneable: c1307)
ctt1.members.create(zoneable: c1308)
ctt1.members.create(zoneable: c1309)
ctt1.members.create(zoneable: c1310)
ctt1.members.create(zoneable: c1311)
ctt1.members.create(zoneable: c1312)
ctt1.members.create(zoneable: c1313)
ctt1.members.create(zoneable: c1314)
ctt1.members.create(zoneable: c1318)
ctt1.members.create(zoneable: c1315)
ctt1.members.create(zoneable: c1316)
ctt1.members.create(zoneable: c1317)
ctt1.members.create(zoneable: c1601)
ctt1.members.create(zoneable: c1602)
ctt1.members.create(zoneable: c1603)
ctt1.members.create(zoneable: c1604)
ctt1.members.create(zoneable: c1605)
ctt1.members.create(zoneable: c1606)
ctt1.members.create(zoneable: c1607)
ctt1.members.create(zoneable: c1608)
ctt1.members.create(zoneable: c1609)
ctt1.members.create(zoneable: c1610)
ctt1.members.create(zoneable: c1705)
ctt1.members.create(zoneable: c1709)
ctt1.members.create(zoneable: c1804)
ctt1.members.create(zoneable: c1813)
ctt1.members.create(zoneable: c0401)
ctt1.members.create(zoneable: c0402)
ctt1.members.create(zoneable: c0403)
ctt1.members.create(zoneable: c0404)
ctt1.members.create(zoneable: c0405)
ctt1.members.create(zoneable: c0406)
ctt1.members.create(zoneable: c0407)
ctt1.members.create(zoneable: c0408)
ctt1.members.create(zoneable: c0409)
ctt1.members.create(zoneable: c0410)
ctt1.members.create(zoneable: c0411)
ctt1.members.create(zoneable: c0412)
ctt1.members.create(zoneable: c0914)
ctt1.members.create(zoneable: c1701)
ctt1.members.create(zoneable: c1702)
ctt1.members.create(zoneable: c1703)
ctt1.members.create(zoneable: c1704)
ctt1.members.create(zoneable: c1706)
ctt1.members.create(zoneable: c1707)
ctt1.members.create(zoneable: c1708)
ctt1.members.create(zoneable: c1710)
ctt1.members.create(zoneable: c1711)
ctt1.members.create(zoneable: c1712)
ctt1.members.create(zoneable: c1713)
ctt1.members.create(zoneable: c1714)
ctt1.members.create(zoneable: c1801)
ctt1.members.create(zoneable: c1805)
ctt1.members.create(zoneable: c1815)
ctt1.members.create(zoneable: c1819)
ctt2.members.create(zoneable: c0501)
ctt2.members.create(zoneable: c0502)
ctt2.members.create(zoneable: c0503)
ctt2.members.create(zoneable: c0504)
ctt2.members.create(zoneable: c0505)
ctt2.members.create(zoneable: c0506)
ctt2.members.create(zoneable: c0507)
ctt2.members.create(zoneable: c0508)
ctt2.members.create(zoneable: c0509)
ctt2.members.create(zoneable: c0510)
ctt2.members.create(zoneable: c0511)
ctt2.members.create(zoneable: c0902)
ctt2.members.create(zoneable: c0903)
ctt2.members.create(zoneable: c0904)
ctt2.members.create(zoneable: c0905)
ctt2.members.create(zoneable: c0906)
ctt2.members.create(zoneable: c0907)
ctt2.members.create(zoneable: c0908)
ctt2.members.create(zoneable: c0909)
ctt2.members.create(zoneable: c0910)
ctt2.members.create(zoneable: c0911)
ctt2.members.create(zoneable: c0912)
ctt2.members.create(zoneable: c0913)
ctt2.members.create(zoneable: c1209)
ctt2.members.create(zoneable: c1212)
ctt2.members.create(zoneable: c1413)
ctt2.members.create(zoneable: c0201)
ctt2.members.create(zoneable: c0202)
ctt2.members.create(zoneable: c0203)
ctt2.members.create(zoneable: c0204)
ctt2.members.create(zoneable: c0205)
ctt2.members.create(zoneable: c0206)
ctt2.members.create(zoneable: c0207)
ctt2.members.create(zoneable: c0208)
ctt2.members.create(zoneable: c0209)
ctt2.members.create(zoneable: c0210)
ctt2.members.create(zoneable: c0211)
ctt2.members.create(zoneable: c0212)
ctt2.members.create(zoneable: c0213)
ctt2.members.create(zoneable: c0214)
ctt2.members.create(zoneable: c0701)
ctt2.members.create(zoneable: c0702)
ctt2.members.create(zoneable: c0703)
ctt2.members.create(zoneable: c0704)
ctt2.members.create(zoneable: c0705)
ctt2.members.create(zoneable: c0706)
ctt2.members.create(zoneable: c0707)
ctt2.members.create(zoneable: c0708)
ctt2.members.create(zoneable: c0709)
ctt2.members.create(zoneable: c0710)
ctt2.members.create(zoneable: c0711)
ctt2.members.create(zoneable: c0712)
ctt2.members.create(zoneable: c0713)
ctt2.members.create(zoneable: c0714)
ctt2.members.create(zoneable: c1201)
ctt2.members.create(zoneable: c1202)
ctt2.members.create(zoneable: c1203)
ctt2.members.create(zoneable: c1204)
ctt2.members.create(zoneable: c1205)
ctt2.members.create(zoneable: c1206)
ctt2.members.create(zoneable: c1207)
ctt2.members.create(zoneable: c1208)
ctt2.members.create(zoneable: c1210)
ctt2.members.create(zoneable: c1211)
ctt2.members.create(zoneable: c1213)
ctt2.members.create(zoneable: c1214)
ctt2.members.create(zoneable: c1215)
ctt2.members.create(zoneable: c1501)
ctt2.members.create(zoneable: c1505)
ctt2.members.create(zoneable: c1509)
ctt2.members.create(zoneable: c1513)
ctt2.members.create(zoneable: c0801)
ctt2.members.create(zoneable: c0802)
ctt2.members.create(zoneable: c0803)
ctt2.members.create(zoneable: c0804)
ctt2.members.create(zoneable: c0805)
ctt2.members.create(zoneable: c0806)
ctt2.members.create(zoneable: c0807)
ctt2.members.create(zoneable: c0808)
ctt2.members.create(zoneable: c0809)
ctt2.members.create(zoneable: c0810)
ctt2.members.create(zoneable: c0811)
ctt2.members.create(zoneable: c0812)
ctt2.members.create(zoneable: c0813)
ctt2.members.create(zoneable: c0814)
ctt2.members.create(zoneable: c0815)
ctt2.members.create(zoneable: c0816)
cam.members.create(zoneable: c3101)
cam.members.create(zoneable: c3102)
cam.members.create(zoneable: c3103)
cam.members.create(zoneable: c3104)
cam.members.create(zoneable: c3105)
cam.members.create(zoneable: c3106)
cam.members.create(zoneable: c3107)
cam.members.create(zoneable: c3108)
cam.members.create(zoneable: c3109)
cam.members.create(zoneable: c3110)
cam.members.create(zoneable: c3201)
cam.members.create(zoneable: c4101)
cam.members.create(zoneable: c4201)
cam.members.create(zoneable: c4202)
cam.members.create(zoneable: c4203)
cam.members.create(zoneable: c4204)
cam.members.create(zoneable: c4205)
cam.members.create(zoneable: c4206)
cam.members.create(zoneable: c4301)
cam.members.create(zoneable: c4302)
cam.members.create(zoneable: c4401)
cam.members.create(zoneable: c4501)
cam.members.create(zoneable: c4502)
cam.members.create(zoneable: c4601)
cam.members.create(zoneable: c4602)
cam.members.create(zoneable: c4603)
cam.members.create(zoneable: c4701)
cam.members.create(zoneable: c4801)
cam.members.create(zoneable: c4802)
cam.members.create(zoneable: c4901)

#ZONA PORTUGAL
n10=Spree::Zone.create(name: 'PT', description: 'Portugal', default_tax: true)
n10.members.create(zoneable: ctt1)
n10.members.create(zoneable: ctt2)
n10.members.create(zoneable: cam)

#Configurações Spree::ShippingMethod
Spree::ShippingMethod.delete_all
Spree::Calculator.delete_all
sc=Spree::ShippingCategory.first
cl1=Spree::Calculator::Shipping::SimpleWeight.create!()
cl2=Spree::Calculator::Shipping::SimpleWeight.create!()
cl3=Spree::Calculator::Shipping::SimpleWeight.create!()
fl1=Spree::Calculator::Shipping::FlatRate.create!()
fl2=Spree::Calculator::Shipping::FlatPercentItemTotal.create!()
sm1=Spree::ShippingMethod.new(name: "CTT código postal de 1-5",admin_name: "ctt-cp1-5")
sm2=Spree::ShippingMethod.new(name: "CTT código postal de 6-8",admin_name: "ctt-cp6-8")
sm3=Spree::ShippingMethod.new(name: "CTT código postal 9",admin_name: "ctt-cp9")
sm4=Spree::ShippingMethod.new(name: "CTT à cobrança",admin_name: "ctt-cobranca")
sm5=Spree::ShippingMethod.new(name: "Levantamento Loja Fruga",admin_name: "loja-fruga")
sm1.shipping_categories << sc
sm2.shipping_categories << sc
sm3.shipping_categories << sc
sm4.shipping_categories << sc
sm5.shipping_categories << sc
sm1.zones << ctt1
sm2.zones << ctt2
sm3.zones << cam
sm4.zones << n10
sm5.zones << n10
sm1.calculator=cl1
sm2.calculator=cl2
sm3.calculator=cl3
sm4.calculator=fl1
sm5.calculator=fl2
sm1.save!
sm2.save!
sm3.save!
sm4.save!
sm5.save!
Spree::Preference.where("key like '/spree/calculator/shipping/%'").delete_all
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/costs_string/" + cl1.id.to_s) { |u| u.value="2:4.1\r\n5:5.25\r\n10:7.9\r\n15:10.6\r\n20:13.2\r\n25:16.2\r\n30:19";u.value_type="text" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/default_weight/" + cl1.id.to_s) { |u| u.value="0.1";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/max_item_size/" + cl1.id.to_s) { |u| u.value="200";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/handling_fee/" + cl1.id.to_s) { |u| u.value="5";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/handling_max/" + cl1.id.to_s) { |u| u.value="100";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/costs_string/" + cl2.id.to_s) { |u| u.value="2:4.65\r\n5:6.25\r\n10:9.5\r\n15:12.45\r\n20:15.1\r\n25:18.4\r\n30:21.6";u.value_type="text" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/default_weight/" + cl2.id.to_s) { |u| u.value="0.1";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/max_item_size/" + cl2.id.to_s) { |u| u.value="200";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/handling_fee/" + cl2.id.to_s) { |u| u.value="5";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/handling_max/" + cl2.id.to_s) { |u| u.value="100";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/costs_string/" + cl3.id.to_s) { |u| u.value="2:6.45\r\n5:8.8\r\n10:15.4\r\n15:23.95\r\n20:30.9\r\n25:38\r\n30:43";u.value_type="text" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/default_weight/" + cl3.id.to_s) { |u| u.value="0.1";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/max_item_size/" + cl3.id.to_s) { |u| u.value="200";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/handling_fee/" + cl3.id.to_s) { |u| u.value="5";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/simple_weight/handling_max/" + cl3.id.to_s) { |u| u.value="100";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/flat_rate/amount/" + fl1.id.to_s) { |u| u.value="10.0";u.value_type="decimal" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/flat_rate/currency/" + fl1.id.to_s) { |u| u.value="EUR";u.value_type="string" }
Spree::Preference.find_or_create_by!(key: "/spree/calculator/shipping/flat_percent_item_total/flat_percent/" + fl2.id.to_s) { |u| u.value="1.0";u.value_type="decimal" }

# Locais de stock por defeito
Spree::StockLocation.delete_all
Spree::StockLocation.create(name: "Loja Fruga", 
  address1: "Rua Dr. António Costa Maia 124, Loja 14",
  address2: nil,
  city: "MAIA", 
  state_id: c1306.id, 
  state_name: c1306.name, 
  country_id: pt.id, 
  zipcode: "4470-568", 
  phone: "966947488", 
  active: true, 
  backorderable_default: true, 
  propagate_all_variants: true, 
  admin_name: "loja-fruga"
)
  
# TAXONOMIA Fruga
Spree::Taxon.delete_all
Spree::Taxonomy.delete_all

#Nivel principal
tx1 = Spree::Taxonomy.create(name: "Moda")                   # 352.858
tx2 = Spree::Taxonomy.create(name: "Lazer")                  # 328.861
tx3 = Spree::Taxonomy.create(name: "Serviços")               #  29.427
tx4 = Spree::Taxonomy.create(name: "Desporto")               #  53.554
tx5 = Spree::Taxonomy.create(name: "Móveis, Casa e Jardim")  # 166.001
tx6 = Spree::Taxonomy.create(name: "Tecnologia")             # 161.061
tx7 = Spree::Taxonomy.create(name: "Telemóveis e Tablets")   #  42.439
tx8 = Spree::Taxonomy.create(name: "Outros")                 #  41.518

#Nivel 2
t11 = tx1.taxons.create(parent_id: tx1.taxons.root.id, name: "Roupa", permalink: "roupa") # 136.464
t12 = tx1.taxons.create(parent_id: tx1.taxons.root.id, name: "Calçado", permalink: "calcado") # 51.599
t13 = tx1.taxons.create(parent_id: tx1.taxons.root.id, name: "Bebé e Criança", permalink: "bebe-crianca") # 67.201
t14 = tx1.taxons.create(parent_id: tx1.taxons.root.id, name: "Malas e Acessórios", permalink: "malas-acessorios") # 42.906
t15 = tx1.taxons.create(parent_id: tx1.taxons.root.id, name: "Saude e Beleza", permalink: "saude-beleza") # 16.906
t16 = tx1.taxons.create(parent_id: tx1.taxons.root.id, name: "Jóias, Relógios e Bijuteria", permalink: "joias-relogios-bijuteria") # 38.017

t21 = tx2.taxons.create(parent_id: tx2.taxons.root.id, name: "Brinquedos e Jogos", permalink: "brinquedos-jogos")
t22 = tx2.taxons.create(parent_id: tx2.taxons.root.id, name: "Instrumentos musicais", permalink: "instrumentos-musicais")
t23 = tx2.taxons.create(parent_id: tx2.taxons.root.id, name: "Livros e Revistas", permalink: "livros-revistas")
t24 = tx2.taxons.create(parent_id: tx2.taxons.root.id, name: "DVD e Filmes", permalink: "dvd-filmes")
t25 = tx2.taxons.create(parent_id: tx2.taxons.root.id, name: "Discos Vinil e CDs de música", permalink: "vinil-cd-musica")

t31 = tx3.taxons.create(parent_id: tx3.taxons.root.id, name: "Domésticos", permalink: "domesticos")
t32 = tx3.taxons.create(parent_id: tx3.taxons.root.id, name: "Reparações e Mudanças", permalink: "reparacoes-mudancas")
t33 = tx3.taxons.create(parent_id: tx3.taxons.root.id, name: "Técnicos", permalink: "tecnicos")
t34 = tx3.taxons.create(parent_id: tx3.taxons.root.id, name: "Saude e Beleza", permalink: "saude-beleza")

t41 = tx4.taxons.create(parent_id: tx4.taxons.root.id, name: "Artigos desportivos", permalink: "artigos-desportivos")
t42 = tx4.taxons.create(parent_id: tx4.taxons.root.id, name: "Bicicletas", permalink: "bicicletas")
t43 = tx4.taxons.create(parent_id: tx4.taxons.root.id, name: "Surf e Bodyboard", permalink: "surf-bodyboard")

t51 = tx5.taxons.create(parent_id: tx5.taxons.root.id, name: "Utilidades e Decoração", permalink: "utilidades-decoracao")
t52 = tx5.taxons.create(parent_id: tx5.taxons.root.id, name: "Electrodomésticos", permalink: "electrodomesticos")
t53 = tx5.taxons.create(parent_id: tx5.taxons.root.id, name: "Móveis", permalink: "moveis")
t54 = tx5.taxons.create(parent_id: tx5.taxons.root.id, name: "Jardim e Bricolage", permalink: "jardim-bricolage")


#Nivel 3
t1101 = tx1.taxons.create(parent_id: t11.id, name: "Homem", permalink: "homem") # 20.295
t1102 = tx1.taxons.create(parent_id: t11.id, name: "Mulher", permalink: "mulher") # 94.037
t1103 = tx1.taxons.create(parent_id: t11.id, name: "Acessórios", permalink: "acessorios") # 2.035
#t1104 = tx1.taxons.create(parent_id: t11.id, name: "Trajes", permalink: "trajes") # 536

#Nivel 4
t110201=tx1.taxons.create(parent_id: t1102.id, name: "Casacos", permalink: "casacos") # 13.870
t110202=tx1.taxons.create(parent_id: t1102.id, name: "Vestidos", permalink: "vestidos") # 9.973
t110203=tx1.taxons.create(parent_id: t1102.id, name: "Camisolas", permalink: "camisolas") # 11.514
t110204=tx1.taxons.create(parent_id: t1102.id, name: "Calças", permalink: "calcas") # 11.761
t110205=tx1.taxons.create(parent_id: t1102.id, name: "Saias", permalink: "saias") # 3.974
t110206=tx1.taxons.create(parent_id: t1102.id, name: "Calças de Ganga", permalink: "calcas-de-ganga") # 3.528
t110207=tx1.taxons.create(parent_id: t1102.id, name: "Camisas", permalink: "camisas") # 3.444
t110208=tx1.taxons.create(parent_id: t1102.id, name: "Tops", permalink: "tops") # 3.418
t110209=tx1.taxons.create(parent_id: t1102.id, name: "Túnicas", permalink: "tunicas") # 2.192
t110210=tx1.taxons.create(parent_id: t1102.id, name: "Casacos de Malha", permalink: "casacos-malha") # 1.820
t110211=tx1.taxons.create(parent_id: t1102.id, name: "T-Shirts", permalink: "t-shirts") # 1.810
t110212=tx1.taxons.create(parent_id: t1102.id, name: "Calções", permalink: "calcoes") # 1.594
t110213=tx1.taxons.create(parent_id: t1102.id, name: "Coletes", permalink: "coletes") # 1.152
t110214=tx1.taxons.create(parent_id: t1102.id, name: "Blusões", permalink: "blusoes") # 1.116
t110215=tx1.taxons.create(parent_id: t1102.id, name: "Bermudas", permalink: "bermudas") # 772
t110216=tx1.taxons.create(parent_id: t1102.id, name: "Meias", permalink: "meias") # 983
t110217=tx1.taxons.create(parent_id: t1102.id, name: "Fatos", permalink: "fatos") # 977
t110218=tx1.taxons.create(parent_id: t1102.id, name: "Vestidos de Noite", permalink: "vestidos-noite") # 864
t110219=tx1.taxons.create(parent_id: t1102.id, name: "Bikinis", permalink: "bikinis") # 594
t110220=tx1.taxons.create(parent_id: t1102.id, name: "Mini Saias", permalink: "mini-saias") # 558
t110221=tx1.taxons.create(parent_id: t1102.id, name: "Desporto", permalink: "desporto") # 532
t110222=tx1.taxons.create(parent_id: t1102.id, name: "Gabardinas", permalink: "gabardinas") # 470
t110223=tx1.taxons.create(parent_id: t1102.id, name: "Leggings", permalink: "leggings") # 448
t110224=tx1.taxons.create(parent_id: t1102.id, name: "Grávida", permalink: "gravida") # 315
t110225=tx1.taxons.create(parent_id: t1102.id, name: "Pijamas", permalink: "pijamas") # 286
t110226=tx1.taxons.create(parent_id: t1102.id, name: "Soutien", permalink: "soutien") # 371
t110227=tx1.taxons.create(parent_id: t1102.id, name: "Sweats", permalink: "sweats") # 360
t110228=tx1.taxons.create(parent_id: t1102.id, name: "Sobretudos", permalink: "sobretudos") # 306
t110229=tx1.taxons.create(parent_id: t1102.id, name: "Cuecas", permalink: "cuecas") # 311
t110230=tx1.taxons.create(parent_id: t1102.id, name: "Body", permalink: "body") # 185
t110231=tx1.taxons.create(parent_id: t1102.id, name: "Fato de Banho", permalink: "fato-banho") # 95
t110232=tx1.taxons.create(parent_id: t1102.id, name: "Shorts", permalink: "shorts") # 78

t1500 = tx1.taxons.create(parent_id: t15.id, name: "Cabelo", permalink: "cabelo")
t1501 = tx1.taxons.create(parent_id: t15.id, name: "Cuidado de Rosto", permalink: "cuidado-rosto")
t1502 = tx1.taxons.create(parent_id: t15.id, name: "Maquilhagem", permalink: "maquilhagem")
t1503 = tx1.taxons.create(parent_id: t15.id, name: "Cuidado de Corpo", permalink: "cuidado-corpo")
t1504 = tx1.taxons.create(parent_id: t15.id, name: "Perfumes", permalink: "perfumes")
t1505 = tx1.taxons.create(parent_id: t15.id, name: "Cuidado de Mãos", permalink: "cuidado-maos")
t1506 = tx1.taxons.create(parent_id: t15.id, name: "Equipamentos Médicos", permalink: "equipamentos-medicos")
t1507 = tx1.taxons.create(parent_id: t15.id, name: "Cuidado de Pés", permalink: "cuidado-pes")
t1508 = tx1.taxons.create(parent_id: t15.id, name: "Hegiene Oral", permalink: "hegiene-oral")
t1509 = tx1.taxons.create(parent_id: t15.id, name: "Solares", permalink: "solares")

t2301 = tx2.taxons.create(parent_id: t23.id, name: "Arte", permalink: "arte")
t2302 = tx2.taxons.create(parent_id: t23.id, name: "Educação", permalink: "educacao")
t2303 = tx2.taxons.create(parent_id: t23.id, name: "Enciclopédias", permalink: "enciclopedias")
t2304 = tx2.taxons.create(parent_id: t23.id, name: "Engenharia", permalink: "engenharia")
t2305 = tx2.taxons.create(parent_id: t23.id, name: "Gastronomia", permalink: "eastronomia")
t2306 = tx2.taxons.create(parent_id: t23.id, name: "Gestão", permalink: "gestao")
t2307 = tx2.taxons.create(parent_id: t23.id, name: "História", permalink: "historia")
t2308 = tx2.taxons.create(parent_id: t23.id, name: "Informática", permalink: "informatica")
t2309 = tx2.taxons.create(parent_id: t23.id, name: "Jovem", permalink: "jovem")
t2310 = tx2.taxons.create(parent_id: t23.id, name: "Lazer", permalink: "lazer")
t2311 = tx2.taxons.create(parent_id: t23.id, name: "Literatura Internacional", permalink: "literatura-internacional")
t2312 = tx2.taxons.create(parent_id: t23.id, name: "Literatura Portuguesa", permalink: "literatura-portuguesa")
t2313 = tx2.taxons.create(parent_id: t23.id, name: "Auto-ajuda", permalink: "auto-ajuda")
t2314 = tx2.taxons.create(parent_id: t23.id, name: "Livros Escolares", permalink: "livros-escolares")
t2315 = tx2.taxons.create(parent_id: t23.id, name: "Política", permalink: "politica")
t2316 = tx2.taxons.create(parent_id: t23.id, name: "Práticos", permalink: "praticos")
t2317 = tx2.taxons.create(parent_id: t23.id, name: "Religião", permalink: "religiao")
t2318 = tx2.taxons.create(parent_id: t23.id, name: "Revistas", permalink: "revistas")
t2319 = tx2.taxons.create(parent_id: t23.id, name: "Saúde", permalink: "saude")
t2320 = tx2.taxons.create(parent_id: t23.id, name: "Viagens", permalink: "viagens")
t2321 = tx2.taxons.create(parent_id: t23.id, name: "Banda Desenhada", permalink: "banda-desenhada")
t2322 = tx2.taxons.create(parent_id: t23.id, name: "Ciências Naturais", permalink: "ciencias-naturais")
t2323 = tx2.taxons.create(parent_id: t23.id, name: "Ciências Sociais", permalink: "ciencias-sociais")
t2324 = tx2.taxons.create(parent_id: t23.id, name: "Desporto", permalink: "desporto")
t2325 = tx2.taxons.create(parent_id: t23.id, name: "Direito", permalink: "direito")
t2326 = tx2.taxons.create(parent_id: t23.id, name: "Dinheiros", permalink: "dinheiros")

t3101 = tx3.taxons.create(parent_id: t31.id, name: "Acompanhamento de Idosos", permalink: "acompanhamento-idosos")
t3102 = tx3.taxons.create(parent_id: t31.id, name: "Amas e Babysitters", permalink: "amas-babysitters")
t3103 = tx3.taxons.create(parent_id: t31.id, name: "Apoio domiciliário a Animais", permalink: "apoio-domiciliario-animais")
t3104 = tx3.taxons.create(parent_id: t31.id, name: "Limpezas", permalink: "limpezas")

t3201 = tx3.taxons.create(parent_id: t32.id, name: "Transportes e Mudanças", permalink: "transportes-mudancas")
t3202 = tx3.taxons.create(parent_id: t32.id, name: "Obras e Remodelações", permalink: "obras-remodelacoes")
t3203 = tx3.taxons.create(parent_id: t32.id, name: "Manutenção", permalink: "manutencao")

t3301 = tx3.taxons.create(parent_id: t33.id, name: "Serviços Informáticos", permalink: "servicos-informaticos")
t3302 = tx3.taxons.create(parent_id: t33.id, name: "Serviços Financeiros", permalink: "servicos-financeiros")
t3303 = tx3.taxons.create(parent_id: t33.id, name: "Línguas e Traduções", permalink: "linguas-traducoes")
t3304 = tx3.taxons.create(parent_id: t33.id, name: "Formação Profissional", permalink: "formacao-profissional")
t3305 = tx3.taxons.create(parent_id: t33.id, name: "Explicações e Aulas Particulares", permalink: "explicacoes-aulas-particulares")
t3306 = tx3.taxons.create(parent_id: t33.id, name: "Advogados", permalink: "advogados")

t3401 = tx3.taxons.create(parent_id: t34.id, name: "Terapias e Massagens", permalink: "terapias-massagens")
t3402 = tx3.taxons.create(parent_id: t34.id, name: "Saúde e Enfermagem", permalink: "saude-enfermagem")
t3403 = tx3.taxons.create(parent_id: t34.id, name: "Beleza e Moda", permalink: "beleza-moda")
