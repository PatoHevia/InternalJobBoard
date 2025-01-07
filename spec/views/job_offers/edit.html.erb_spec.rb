require 'rails_helper'

RSpec.describe "job_offers/edit", type: :view do
  let(:job_offer) {
    JobOffer.create!()
  }

  before(:each) do
    assign(:job_offer, job_offer)
  end

  it "renders the edit job_offer form" do
    render

    assert_select "form[action=?][method=?]", job_offer_path(job_offer), "post" do
    end
  end
end
