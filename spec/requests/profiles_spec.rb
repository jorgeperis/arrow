require "rails_helper"

RSpec.describe "Profiles", type: :request do
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe "GET /profile/edit" do
    it "returns 200" do
      get edit_profile_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /profile" do
    it "updates sex and date of birth" do
      patch profile_path, params: { user: { gender: "male", birthdate: "1990-05-01" } }

      user.reload
      expect(user.gender).to eq("male")
      expect(user.birthdate).to eq(Date.new(1990, 5, 1))
      expect(user.profile_complete?).to be true
    end

    it "rejects an invalid gender" do
      patch profile_path, params: { user: { gender: "invalid" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
