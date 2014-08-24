# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#Spree::Core::Engine.load_seed if defined?(Spree::Core)
#Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

store = Spree::Store.where(default: true).first
store.name = 'Casa dos Quadros'
store.url = 'loja.casadosquadros.com.br'
store.meta_description = 'Decoração de espaços particulares ou empresariais com uma excelente proposta de produtos e serviços com qualidade e profissionalismo'
store.meta_keywords = 'fenix, decorare, quadros, decoração, excelencia, profissionalismo, qualidade'
store.seo_title = 'Casa dos Quadros - Decoração com requinte'
store.mail_from_address = 'fenixdcbr@gmail.com'
store.default_currency = "BRL"
store.code = "fenix"
store.save!

Spree::Country.where("name!='Brazil'").delete_all
Spree::State.delete_all

br=Spree::Country.find_by_name("Brazil")
Spree::Config[:address_requires_state]=true
Spree::Config[:admin_interface_logo]='logo/logo-loja-casadosquadros-admin.png'
Spree::Config[:admin_products_per_page]=10
Spree::Config[:allow_backorder_shipping]=false # should only be true if you don't need to track inventory
Spree::Config[:allow_checkout_on_gateway_error]=false
Spree::Config[:allow_guest_checkout]=true
Spree::Config[:allow_ssl_in_development_and_test]=false
Spree::Config[:allow_ssl_in_production]=false
Spree::Config[:allow_ssl_in_staging]=false
Spree::Config[:alternative_billing_phone]=false # Request extra phone for bill addr
Spree::Config[:alternative_shipping_phone]=false # Request extra phone for ship addr
Spree::Config[:always_include_confirm_step]=false 
Spree::Config[:always_put_site_name_in_title]=false
Spree::Config[:auto_capture]=false # automatically capture the credit card (as opposed to just authorize and capture later)
Spree::Config[:binary_inventory_cache]=false # only invalidate product cache when a stock item changes whether it is in_stock
Spree::Config[:check_for_spree_alerts]=false
Spree::Config[:checkout_zone]=nil # replace with the name of a zone if you would like to limit the countries
Spree::Config[:company]=false # Request company field for billing and shipping addr
Spree::Config[:currency]="BRL"
Spree::Config[:currency_decimal_mark]=","
Spree::Config[:currency_symbol_position]="before"
Spree::Config[:currency_sign_before_symbol]=true
Spree::Config[:currency_thousands_separator]="."
Spree::Config[:display_currency]=false
Spree::Config[:default_country_id] = br.id
Spree::Config[:dismissed_spree_alerts]=''
Spree::Config[:hide_cents]=false
Spree::Config[:last_check_for_spree_alerts]=nil
Spree::Config[:layout]='spree/layouts/spree_application'
Spree::Config[:logo]='logo/logo-loja-casadosquadros.png'
Spree::Config[:max_level_in_taxons_menu]=1 # maximum nesting level in taxons menu
Spree::Config[:orders_per_page]=15
Spree::Config[:properties_per_page]=15
Spree::Config[:products_per_page]=12
Spree::Config[:promotions_per_page]=15
Spree::Config[:redirect_https_to_http]=true
Spree::Config[:require_master_price]=true
Spree::Config[:shipping_instructions]=false # Request instructions/info for shipping
Spree::Config[:show_only_complete_orders_by_default]=true
Spree::Config[:show_variant_full_price]=false #Displays variant full price or difference with product price. 
Spree::Config[:show_products_without_price]=false
Spree::Config[:show_raw_product_description]=false
Spree::Config[:tax_using_ship_address]=true
Spree::Config[:track_inventory_levels]=true # Determines whether to track on_hand values for variants / products.

# email config
Spree::Config[:send_core_emails]=true
Spree::Config[:mails_from]='loja@casadosquadros.com.br'

#Estados
c11=br.states.create!(name: 'Distrito Federal',abbr: 'DF')
c12=br.states.create!(name: 'Goiás',abbr: 'GO')
c13=br.states.create!(name: 'Mato Grosso',abbr: 'MT')
c14=br.states.create!(name: 'Mato Grosso do Sul',abbr: 'MS')
c21=br.states.create!(name: 'Alagoas',abbr: 'AL')
c22=br.states.create!(name: 'Bahia',abbr: 'BA')
c23=br.states.create!(name: 'Ceará',abbr: 'CE')
c24=br.states.create!(name: 'Maranhão',abbr: 'MA')
c25=br.states.create!(name: 'Paraíba',abbr: 'PB')
c26=br.states.create!(name: 'Pernambuco',abbr: 'PE')
c27=br.states.create!(name: 'Piauí',abbr: 'PI')
c28=br.states.create!(name: 'Rio Grande do Norte',abbr: 'RN')
c29=br.states.create!(name: 'Sergipe',abbr: 'SE')
c31=br.states.create!(name: 'Acre',abbr: 'AC')
c32=br.states.create!(name: 'Amapá',abbr: 'AP')
c33=br.states.create!(name: 'Amazonas',abbr: 'AM')
c34=br.states.create!(name: 'Pará',abbr: 'PA')
c35=br.states.create!(name: 'Rondonia',abbr: 'RO')
c36=br.states.create!(name: 'Roraima',abbr: 'RR')
c37=br.states.create!(name: 'Tocantins',abbr: 'TO')
c41=br.states.create!(name: 'Espírito Santo',abbr: 'ES')
c42=br.states.create!(name: 'Minas Gerais',abbr: 'MG')
c43=br.states.create!(name: 'Rio de Janeiro',abbr: 'RJ')
c44=br.states.create!(name: 'São Paulo',abbr: 'SP')
c51=br.states.create!(name: 'Paraná',abbr: 'PR')
c52=br.states.create!(name: 'Rio Grande do Sul',abbr: 'RS')
c53=br.states.create!(name: 'Santa Catarina',abbr: 'SC')

Spree::Zone.delete_all
z1=Spree::Zone.create!(name: 'Centro-Oeste', description: 'Região Centro-Oeste do brasil', default_tax: false)
z2=Spree::Zone.create!(name: 'Nordeste', description: 'Região Nordeste do brasil', default_tax: false)
z3=Spree::Zone.create!(name: 'Norte', description: 'Região Norte do brasil', default_tax: false)
z4=Spree::Zone.create!(name: 'Sudeste', description: 'Região Sudeste do brasil', default_tax: false)
z5=Spree::Zone.create!(name: 'Sul', description: 'Região Sul do brasil', default_tax: false)
z1.members.create(zoneable: c11)
z1.members.create(zoneable: c12)
z1.members.create(zoneable: c13)
z1.members.create(zoneable: c14)
z2.members.create(zoneable: c21)
z2.members.create(zoneable: c22)
z2.members.create(zoneable: c23)
z2.members.create(zoneable: c24)
z2.members.create(zoneable: c25)
z2.members.create(zoneable: c26)
z2.members.create(zoneable: c27)
z2.members.create(zoneable: c28)
z2.members.create(zoneable: c29)
z3.members.create(zoneable: c31)
z3.members.create(zoneable: c32)
z3.members.create(zoneable: c33)
z3.members.create(zoneable: c34)
z3.members.create(zoneable: c35)
z3.members.create(zoneable: c36)
z3.members.create(zoneable: c37)
z4.members.create(zoneable: c41)
z4.members.create(zoneable: c42)
z4.members.create(zoneable: c43)
z4.members.create(zoneable: c44)
z5.members.create(zoneable: c51)
z5.members.create(zoneable: c52)
z5.members.create(zoneable: c53)

brt=Spree::Zone.create!(name: 'Brasil', description: 'Todas as regiões do brasil', default_tax: true)
brt.members.create(zoneable: z1)
brt.members.create(zoneable: z2)
brt.members.create(zoneable: z3)
brt.members.create(zoneable: z4)
brt.members.create(zoneable: z5)

#Categoria de impostos unica 10% para Todas as regiões do brasil
tc=Spree::TaxCategory.find_or_create_by!(name: "Total")
tr=Spree::TaxRate.create(name: "Imposto " + brt.name, zone: brt, amount: 0.1, tax_category: tc)
tr.calculator = Spree::Calculator::DefaultTax.create!
tr.save!

# TAXONOMIA Fenix nivel0
Spree::Taxon.delete_all
Spree::Taxonomy.delete_all
t1=Spree::Taxonomy.create(name: 'Pinturas')
t2=Spree::Taxonomy.create(name: 'Impressões')
t3=Spree::Taxonomy.create(name: 'Paineis')
t4=Spree::Taxonomy.create(name: 'Quadros temáticos')
t5=Spree::Taxonomy.create(name: 'Espelhos')
t6=Spree::Taxonomy.create(name: 'Luminárias')

# TAXONOMIA Fenix Nivel1
t11=t1.taxons.create(parent_id: t1.taxons.root.id, name: 'Clássicas', permalink: 'classicas')
t12=t1.taxons.create(parent_id: t1.taxons.root.id, name: 'Modernas', permalink: 'modernas')
t13=t1.taxons.create(parent_id: t1.taxons.root.id, name: 'Abstratas', permalink: 'abstratas')
t14=t1.taxons.create(parent_id: t1.taxons.root.id, name: 'Pincel', permalink: 'pincel')
t15=t1.taxons.create(parent_id: t1.taxons.root.id, name: 'Espatuladas', permalink: 'espatuladas')
t31=t3.taxons.create(parent_id: t3.taxons.root.id, name: 'Singulares', permalink: 'singulares')
t32=t3.taxons.create(parent_id: t3.taxons.root.id, name: 'Contemporâneos', permalink: 'contemporaneos')
t41=t4.taxons.create(parent_id: t4.taxons.root.id, name: 'Particulares', permalink: 'particulares')
t42=t4.taxons.create(parent_id: t4.taxons.root.id, name: 'Empresariais', permalink: 'empresariais')
t51=t5.taxons.create(parent_id: t5.taxons.root.id, name: 'Clássicos', permalink: 'classicos')
t52=t5.taxons.create(parent_id: t5.taxons.root.id, name: 'Modernos', permalink: 'modernos')
t61=t6.taxons.create(parent_id: t6.taxons.root.id, name: 'Alumínio', permalink: 'aluminio')
t62=t6.taxons.create(parent_id: t6.taxons.root.id, name: 'Cristal', permalink: 'cristal')

# TAXONOMIA Fenix Nivel2
t411=t4.taxons.create(parent_id: t41.id, name: 'Quartos', permalink: 'quartos')
t412=t4.taxons.create(parent_id: t41.id, name: 'Closets', permalink: 'closets')
t413=t4.taxons.create(parent_id: t41.id, name: 'Banheiros', permalink: 'banheiros')
t414=t4.taxons.create(parent_id: t41.id, name: 'Cozinhas', permalink: 'cozinhas')
t421=t4.taxons.create(parent_id: t42.id, name: 'Bares', permalink: 'bares')
t422=t4.taxons.create(parent_id: t42.id, name: 'Restaurantes', permalink: 'restaurantes')
t423=t4.taxons.create(parent_id: t42.id, name: 'Escritórios', permalink: 'escritorios')

# Locais de stock por defeito
Spree::StockLocation.delete_all
Spree::StockLocation.create(name: "Casa dos Quadros",
  address1: "R. Felipe Schmidt, 706",
  address2: nil,
  city: "Florianópolis",
  state_id: c53.id,
  state_name: c53.name,
  country_id: br.id,
  zipcode: "88010-001",
  phone: "+55 48 38799001",
  active: true,
  backorderable_default: true,
  propagate_all_variants: true,
  admin_name: "loja"
)

# Google analytics tracker
Spree::Tracker.delete_all
Spree::Tracker.create(analytics_id: "UA-53656094-1",environment: "production", active: true)

Spree::AuthenticationMethod.delete_all
Spree::AuthenticationMethod.create(environment: "production",
  provider: "google_oauth2",
  api_key: ENV['FDGP_API_KEY'],
  api_secret: ENV['FDGP_API_SECRET'],
  active: true
)
Spree::AuthenticationMethod.create(environment: "production",
  provider: "twitter",
  api_key: ENV['FDTW_API_KEY'],
  api_secret: ENV['FDTW_API_SECRET'],
  active: true
)

#Metodos de entrage
Spree::ShippingMethod.delete_all
Spree::Calculator.delete_all
sc=Spree::ShippingCategory.find_by_name("Default")
fl1=Spree::Calculator::Shipping::FlatPercentItemTotal.create!()
sm1=Spree::ShippingMethod.new(name: "Levantamento na Loja",admin_name: "loja-casadosquadros")
sm1.shipping_categories << sc
sm1.zones << z1
sm1.zones << z2
sm1.zones << z3
sm1.zones << z4
sm1.zones << z5
sm1.calculator=fl1
sm1.save!
#Formas de pagamento
Spree::PaymentMethod.delete_all
pm1=Spree::PaymentMethod::Check.create(name: "Na Loja", environment: Rails.env) { |u| u.description="Pagamento feito na loja Casa dos Quadros"; u.active=true }

#OptionType & Values
to1=Spree::OptionType.find_or_create_by!(name: "to1", presentation: "Acabamento")
vo11=to1.option_values.find_or_create_by!(name: "vo11", presentation: "Goldthin")
vo12=to1.option_values.find_or_create_by!(name: "vo12", presentation: "Tela")
vo13=to1.option_values.find_or_create_by!(name: "vo13", presentation: "Nada")
to2=Spree::OptionType.find_or_create_by!(name: "to2", presentation: "Tamanho")
vo21=to2.option_values.find_or_create_by!(name: "vo21", presentation: "Pequeno")
vo22=to2.option_values.find_or_create_by!(name: "vo22", presentation: "Normal")
vo23=to2.option_values.find_or_create_by!(name: "vo23", presentation: "Grande")

Spree::Product.delete_all
Spree::Variant.delete_all
Spree::Asset.delete_all

def image(name, type="png", box="/base")
  images_path = Pathname.new("public/fenix-images" + box)
  path = images_path + "#{name}.#{type}"
  puts images_path
  puts path
  return false if !File.exist?(path)
  File.open(path)
end

prg = [
{name: "Nude - Mario Eloy 1932 - Expressionism", description: "Uma imagem deslumbrante e cheia de criatividade", slug: "nude-mario-eloy-1932-expressionism", meta_description: "Uma Imagem Deslumbrante E Cheia De Criatividade", meta_keywords: "nude,mario,eloy,expressionism", available_on: DateTime.now - 1, shipping_category: sc, price: 100},
{name: "Lisboa - Carlos Botelho", description: "Uma paisagem urbana ocupa um lugar central na obra de Carlos Botelho. Uma obra marcada por um pendor declaradamente expressionista onde pinta cidades, retratos, narrativas. Tema recorrente a sua cidade natal irá afirmar-se como tema central, acompanhando a evolução do seu modo de pensar e fazer. Será Lisboa a protagonista do apaziguamento expressivo e acentuação poética da década de 1940; será Lisboa a servir de mote às experiências abstratizantes dos anos de 1950; e será Lisboa a ocupá-lo, quase em exclusivo, nas décadas finais.", slug: "lisboa-carlos-botelho", meta_description: "Uma Paisagem Urbana Ocupa Um Lugar Central Na Obra De Carlos Botelho. Uma Obra Marcada Por Um Pendor Declaradamente Expressionista Onde Pinta Cidades, Retratos, Narrativas. Tema Recorrente A Sua Cidade Natal Irá Afirmar-Se Como Tema Central, Acompanhando ", meta_keywords: "lisboa,carlos,botelho", available_on: DateTime.now - 1, shipping_category: sc, price: 100}
] 
prg.each do |product_attrs|
  prd=Spree::Product.create!(product_attrs)
  prd.option_types = [to1, to2]
  prd.save!
end

prm = {
"Nude - Mario Eloy 1932 - Expressionism" => { sku: "123456789000", height: 20, width: 21, depth: 1, weight: 0.1, taxon: "Clássicas" },
"Lisboa - Carlos Botelho" => { sku: "123456790000", height: 20, width: 21, depth: 1, weight: 0.1, taxon: "Modernas" }
}
imm = {
"Nude - Mario Eloy 1932 - Expressionism" => { attachment: image("i123456789000", "png", "/base") },
"Lisboa - Carlos Botelho" => { attachment: image("i123456790000", "png", "/base") }
}
vri = {
"Nude - Mario Eloy 1932 - Expressionism" => [ { option_values: [ vo11, vo21 ], sku: "123456789002", height: 10, width: 16, depth: 1, weight: 0.09, price: 195 },  { option_values: [ vo11, vo22 ], sku: "123456789003", height: 20, width: 21, depth: 1, weight: 0.1, price: 200 }, { option_values: [ vo11, vo23 ], sku: "123456789004", height: 30, width: 31, depth: 1, weight: 0.13, price: 300 },  { option_values: [ vo12, vo21 ], sku: "123456789005", height: 10, width: 16, depth: 1, weight: 0.09, price: 105 },  { option_values: [ vo12, vo22 ], sku: "123456789006", height: 20, width: 21, depth: 1, weight: 0.1, price: 110 }, { option_values: [ vo12, vo23 ], sku: "123456789007", height: 30, width: 31, depth: 1, weight: 0.13, price: 210 },  { option_values: [ vo13, vo21 ], sku: "123456789008", height: 10, width: 16, depth: 1, weight: 0.09, price: 95 }, { option_values: [ vo13, vo22 ], sku: "123456789009", height: 20, width: 21, depth: 1, weight: 0.1, price: 100 }, { option_values: [ vo13, vo23 ], sku: "123456789010", height: 30, width: 31, depth: 1, weight: 0.13, price: 200 },  ],
"Lisboa - Carlos Botelho" => [  { option_values: [ vo11, vo21 ], sku: "123456790002", height: 10, width: 16, depth: 1, weight: 0.09, price: 195 },  { option_values: [ vo11, vo22 ], sku: "123456790003", height: 20, width: 21, depth: 1, weight: 0.1, price: 200 }, { option_values: [ vo11, vo23 ], sku: "123456790004", height: 30, width: 31, depth: 1, weight: 0.13, price: 300 },  { option_values: [ vo12, vo21 ], sku: "123456790005", height: 10, width: 16, depth: 1, weight: 0.09, price: 105 },  { option_values: [ vo12, vo22 ], sku: "123456790006", height: 20, width: 21, depth: 1, weight: 0.1, price: 110 }, { option_values: [ vo12, vo23 ], sku: "123456790007", height: 30, width: 31, depth: 1, weight: 0.13, price: 210 },  { option_values: [ vo13, vo21 ], sku: "123456790008", height: 10, width: 16, depth: 1, weight: 0.09, price: 95 }, { option_values: [ vo13, vo22 ], sku: "123456790009", height: 20, width: 21, depth: 1, weight: 0.1, price: 100 }, { option_values: [ vo13, vo23 ], sku: "123456790010", height: 30, width: 31, depth: 1, weight: 0.13, price: 200 },  ]
}
prm.each do |name, variant_attrs|
  prd=Spree::Product.find_by_name!(name)
  txn=variant_attrs.delete(:taxon)
  prd.master.update_attributes!(variant_attrs)
  prd.taxons << Spree::Taxon.find_by_name!(txn)
  prd.master.images.create!(imm[name])
  prd.variants.create!(vri[name])
  prd.variants.each do |variant|
    acabamento = variant.option_value("to1").downcase
    if acabamento == "goldthin"
      main_image = image("i" + prd.master.sku + "-" + acabamento, "png", "/variantes")
      variant.images.create!(attachment: main_image)
    end
  end
end