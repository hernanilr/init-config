# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|

  config.admin_interface_logo = 'logo/lcdq-admin.png'
  config.logo = 'logo/lcdq.png'
  config.layout = 'spree/layouts/spree_application'

  config.address_requires_state = true # should state/state_name be required
  config.admin_products_per_page = 10
  config.allow_backorder_shipping = false # should only be true if you don't need to track inventory
  config.allow_checkout_on_gateway_error = false
  config.allow_guest_checkout = true # se alguem quer pagar sem fazer registo deve poder faze-lo
  config.allow_ssl_in_development_and_test =  false
  config.allow_ssl_in_production = false
  config.allow_ssl_in_staging = false
  config.alternative_billing_phone = false # Request extra phone for bill addr
  config.alternative_shipping_phone = false # Request extra phone for ship addr
  config.always_include_confirm_step = false # Ensures confirmation step is always in checkout_progress bar, but does not force a confirm step if your payment methods do not support it.
  config.always_put_site_name_in_title = true
  config.auto_capture =  false # automatically capture the credit card (as opposed to just authorize and capture later)
  config.check_for_spree_alerts =  true
  config.checkout_zone =  nil # replace with the name of a zone if you would like to limit the countries
  config.company =  false # Request company field for billing and shipping addr
  config.currency =  "BRL"
  config.currency_decimal_mark =  ","
  config.currency_symbol_position =  "before"
  config.currency_thousands_separator =  "."
  config.display_currency =  false
  #config.default_country_id = Spree::Country.where(name: "Portugal").first.id
  config.dismissed_spree_alerts =  ''
  config.hide_cents =  false
  config.last_check_for_spree_alerts =  nil
  config.max_level_in_taxons_menu =  1 # maximum nesting level in taxons menu
  config.orders_per_page =  15
  config.products_per_page =  12
  config.redirect_https_to_http = true
  config.require_master_price =  true
  config.shipment_inc_vat =  false
  config.shipping_instructions =  false # Request instructions/info for shipping
  config.show_only_complete_orders_by_default =  true
  config.show_variant_full_price =  false #Displays variant full price or difference with product price. Default false to be compatible with older behavior
  config.show_products_without_price =  false
  config.show_raw_product_description = false
  config.tax_using_ship_address =  true
  config.track_inventory_levels =  true # Determines whether to track on_hand values for variants / products.

  # Preferences related to image settings
  #config.attachment_default_url =  '/spree/products/:id/:style/:basename.:extension'
  #config.attachment_path =  ':rails_root/public/spree/products/:id/:style/:basename.:extension'
  #Importante para europeus
  #config.attachment_url =  '/spree/products/:id/:style/:basename.:extension'
  #config.attachment_url = ":s3_eu_url"
  #config.attachment_styles =  "{\"mini\":\"48x48>\",\"small\":\"100x100>\",\"product\":\"240x240>\",\"large\":\"600x600>\"}"
  #config.attachment_default_style =  'product'
  #config.s3_access_key = ENV['AWS_ACCESS_KEY'] 
  #config.s3_bucket = "mfruga"
  #config.s3_secret = ENV['AWS_SECRET']
  #config.s3_headers =  "{\"Cache-Control\":\"max-age=31557600\"}"
  #config.use_s3 =  true # Use S3 for images rather than the file system
  #config.s3_protocol = ENV['AWS_PROTOCOL']
  #config.s3_host_alias = ENV['AWS_HOST']

  # Default mail headers settings
  config.send_core_emails = true
  config.mails_from = 'fenixdecorare@gmail.com'
  #config.mail_bcc = nil
  #config.intercept_email = nil

  # Default smtp settings
  #config.override_actionmailer_config = true
  #config.mail_host = 'smtp.gmail.com'
  #config.mail_domain = 'fruga.pt'
  #config.mail_port = 587
  #config.secure_connection_type = "TLS"
  #config.mail_auth_type = "plain"
  #config.smtp_username = ENV['SMTP_FRUGA']
  #config.smtp_password = ENV['SMTP_FRUGA_PASSWORD']

end

# Configuracao base da loja por defeito
store = Spree::Store.where(default: true).first
store.name = 'Casa dos Quadros'
store.url = 'loja.casadosquadros.com.br'
store.meta_description = 'Decoração de espaços particulares ou empresariais com uma excelente proposta de produtos e serviços com qualidade e profissionalismo'
store.meta_keywords = 'fenix, decorare, quadros, decoração, excelencia, profissionalismo, qualidade'
store.seo_title = 'Casa dos Quadros - Decoração com requinte'
store.mail_from_address = 'fenixdecorare@gmail.com'
store.default_currency = "BRL"
store.code = "fenix"
store.save!

Spree.user_class = "Spree::User"

# Configuracao de linguas
SpreeI18n::Config.available_locales = [:'pt-BR', :en]
SpreeI18n::Config.supported_locales = [:'pt-BR', :en]
