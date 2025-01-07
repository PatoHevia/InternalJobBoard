require 'rails_helper'

RSpec.describe "job_offers/index", type: :view do
  before(:each) do
    assign(:job_offers, [
      JobOffer.create!(),
      JobOffer.create!()
    ])
  end

  it "renders a list of job_offers" do
    render
    cell_selector = 'div>p'
  end
end
