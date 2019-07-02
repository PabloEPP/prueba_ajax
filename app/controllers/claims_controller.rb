class ClaimsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @claim = Claim.new(content:params[:claim][:content], user: current_user)
    @claim.company = @company
    @claim.save
  end
end
