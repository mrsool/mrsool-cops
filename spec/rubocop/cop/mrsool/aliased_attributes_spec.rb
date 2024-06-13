# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Mrsool::AliasedAttributes, :config do
  let(:config) do
    RuboCop::Config.new(
      "Mrsool/AliasedAttributes" => {
        "Enabled" => true,
        "Aliases" => {
          "vStatus" => "status",
        }
      }
    )
  end

  it "corrects specified attrs" do
    expect_offense(<<~RUBY)
      order.vStatus
      ^^^^^^^^^^^^^ Use `status` instead of `vStatus`
    RUBY

    expect_correction(<<~RUBY)
      order.status
    RUBY
  end
end
