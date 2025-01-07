require 'rails_helper'

RSpec.describe "job_offers/show", type: :view do
  before(:each) do
    assign(:job_offer, JobOffer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
