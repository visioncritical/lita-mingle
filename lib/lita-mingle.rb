require 'lita'
require 'mingle-api'
require 'time'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require_relative 'helpers/api'
require_relative 'helpers/regex'
require 'lita/handlers/mingle'

Lita::Handlers::Mingle.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
