class MatchesController < ApplicationController
  def new
    @match = Match.new
    @sent_requests = SentRequest.all
    @user = User.find(session[:user_id])
  end

  def create
    match_user = User.all.find { |user| user.full_name == params[:user][:full_name] }

    SentRequest.all.select do |request|
      if request.requested_user == current_user
        if !match_user.nil? && request.user_id == match_user.id
          match = Match.new(user_id: session[:user_id], matched_user_id: match_user.id)
            if match.save
              return redirect_to user_path(session[:user_id])
            end
        else
          flash[:message] = "Guess again succccckeerrr!"
          new_match_url
        end
      else
        flash[:message] = "Guess again succccckeerrr!"
        new_match_url
      end
    end
  end

end
