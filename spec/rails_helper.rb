# frozen_string_literal: true

better_together_path = ENV.fetch(
  'BETTER_TOGETHER_PATH',
  File.expand_path('../../community-engine-rails', __dir__)
)

$LOAD_PATH.unshift(File.expand_path('spec', better_together_path))
require File.expand_path('spec/rails_helper', better_together_path)
require 'better_together/borgberry'

# This gem's factories live under its own spec/factories/, which the host
# app's FactoryBot config (rooted at the host's Rails.root) never scans.
# Require them directly rather than going through
# FactoryBot.definition_file_paths + FactoryBot.reload — reload does a full
# reset and re-derives its file list, which can race with factory_bot_rails'
# own default-path registration and wipe out the host app's own factories.
borgberry_factories_path = File.expand_path('factories', __dir__)
Dir[File.join(borgberry_factories_path, '**', '*.rb')].each { |f| require f }
