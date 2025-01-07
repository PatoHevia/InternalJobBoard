require 'rails_helper'

RSpec.describe "applications/edit", type: :view do
  let(:application) {
    Application.create!()
  }

  before(:each) do
    assign(:application, application)
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_path(application), "post" do
    end
  end
end
