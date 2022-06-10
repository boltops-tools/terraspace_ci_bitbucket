# frozen_string_literal: true

require "terraspace_ci_bitbucket/autoloader"
TerraspaceCiBitbucket::Autoloader.setup

require "json"
require "memoist"

module TerraspaceCiBitbucket
  class Error < StandardError; end
end

Terraspace::Cloud::Ci.register(
  name: "bitbucket",
  env_key: "BITBUCKET_COMMIT",
  root: __dir__,
  exe: ".bitbucket/bin",
)
