require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    context "when not authenticated" do
      it "returns 200 and renders the landing page" do
        get root_path
        expect(response).to have_http_status(:ok)
      end
    end

    context "when authenticated" do
      let(:user) { create(:user) }
      before { sign_in(user) }

      it "redirects to stats" do
        get root_path
        expect(response).to redirect_to(stats_path)
      end

      it "keeps redirecting on a later visit (session persists)" do
        get root_path
        expect(response).to redirect_to(stats_path)

        get root_path
        expect(response).to redirect_to(stats_path)
      end
    end
  end
end
