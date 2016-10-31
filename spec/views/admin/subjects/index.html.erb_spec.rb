require "rails_helper"

RSpec.describe "admin/subjects/index", type: :view do
  let(:subject) {FactoryGirl.create(:subject)}

  it "should display list subject" do
    assign :subjects, [subject]
    render
    expect(rendered).to include subject.name
    expect(rendered).to include subject.description
    expect(rendered).to include l subject.created_at, format: :date_user_create
  end
end
