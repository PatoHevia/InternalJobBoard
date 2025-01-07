require 'rails_helper'

RSpec.describe "job_offers/new", type: :view do
  before(:each) do
    assign(:job_offer, JobOffer.new())
  end

  it "renders new job_offer form" do
    render

    assert_select "form[action=?][method=?]", job_offers_path, "post" do
    end
  end
end
