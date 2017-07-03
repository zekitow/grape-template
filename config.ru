$:.unshift File.expand_path '..', __FILE__

require './config/env'
require './app/app'

use OTR::ActiveRecord::ConnectionManagement
run APIs::App