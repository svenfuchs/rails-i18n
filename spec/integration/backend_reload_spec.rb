require 'spec_helper'

describe "I18n backend reloading" do
  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when called twice" do
    let(:errors) do
      app.run(lambda do
        $stderr = StringIO.new
        2.times do
          I18n.reload!
          I18n.t :hello
        end
        $stderr.string
      end)
    end

    it "doesn't produce warnings" do
      errors.should == ''
    end
  end
end