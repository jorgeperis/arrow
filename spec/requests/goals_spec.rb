require "rails_helper"

RSpec.describe "Goals", type: :request do
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe "GET /goals" do
    it "returns 200" do
      create(:goal, user: user)
      get goals_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /goals" do
    it "creates a goal" do
      expect {
        post goals_path, params: { goal: { distance: "21.097", target_time_formatted: "1:30:00" } }
      }.to change(user.goals, :count).by(1)

      expect(user.goals.last.target_time).to eq(5400)
      expect(response).to redirect_to(goals_path)
    end

    it "rejects invalid input" do
      expect {
        post goals_path, params: { goal: { distance: "", target_time_formatted: "" } }
      }.not_to change(Goal, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /goals/:id" do
    it "updates the goal" do
      goal = create(:goal, user: user, target_time: 2400)
      patch goal_path(goal), params: { goal: { target_time_formatted: "0:38:00" } }

      expect(goal.reload.target_time).to eq(2280)
    end
  end

  describe "DELETE /goals/:id" do
    it "destroys the goal" do
      goal = create(:goal, user: user)
      expect { delete goal_path(goal) }.to change(user.goals, :count).by(-1)
    end

    it "does not allow destroying another user's goal" do
      other = create(:goal, user: create(:user))
      delete goal_path(other)
      expect(response).to have_http_status(:not_found)
    end
  end
end
