require "rails_helper"

RSpec.describe "admin/users/index", type: :view do
  let(:admin) {FactoryGirl.create(:user, :admin)}
  let(:user) {FactoryGirl.create(:user)}

  it "should display list user" do
    assign :users, [admin, user]
    render
    expect(rendered).to include(admin.name)
    expect(rendered).to include(admin.email)
    expect(rendered).to include(admin.role)
    expect(rendered).to include(user.name)
    expect(rendered).to include(user.email)
    expect(rendered).to include(user.role)
  end
end
