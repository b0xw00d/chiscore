require 'rack/test'
require 'spec_helper'
require 'routers/helpers/leaderboard_helper'

describe LeaderboardHelper do
  let(:checkin_time) { "06:00 pm" }
  let(:checkpoint) { double("Checkpoint", :id => 1)}
  let(:team) { double("Team", :id => 1, :checkin_count => 1)}

  context "#evaluate" do
    describe "for admin viewing" do

      let(:status) { LeaderboardHelper::CheckinStatus.new(checkpoint, team, false) }

      before(:each) do
        status.stub(:update_checkin_count)
        ChiScore::Checkins.stub(:checkout_for).and_return(1)
        ChiScore::Checkins.stub(:time_for).and_return(1)
      end

      it "returns blank if checkin has not happened" do
        status.stub(:find_time).and_return(0)
        expect(status.evaluate).to eq("--")
      end

      it "returns time if the checkin has happened" do
        expect(status.evaluate).to eq(checkin_time)
      end
    end

    describe "for public viewing" do

      let(:status) { LeaderboardHelper::CheckinStatus.new(checkpoint, team, true) }

      before(:each) do
        status.stub(:update_checkin_count)
        ChiScore::Checkins.stub(:checkout_for).and_return(1)
        ChiScore::Checkins.stub(:time_for).and_return(1)
      end

      it "returns blank if checkin has not happened" do
        status.stub(:find_time).and_return(0)
        expect(status.evaluate).to eq("--")
      end

      it "returns checked_in_status if currently checked in" do
        status.stub(:checked_out?).and_return(false)
        expect(status.evaluate).to eq(status.html_output("green", checkin_time))
      end

      it "returns checked_out_status if have left checkpoint" do
        expect(status.evaluate).to eq(status.html_output("red", checkin_time))
      end
    end
  end
end
