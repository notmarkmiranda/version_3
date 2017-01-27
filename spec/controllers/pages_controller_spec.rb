require "rails_helper"

RSpec.describe PagesController, type: :controller do
  it "GET show" do
    get :show
    expect(response).to render_template(:show)
  end
end
