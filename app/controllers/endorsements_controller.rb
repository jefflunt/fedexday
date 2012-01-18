class EndorsementsController < ApplicationController
  # POST /endorsements
  # POST /endorsements.json
  def create
    @endorsement = Endorsement.create(params[:endorsement])
    @endorsement.idea.update_attribute(:updated_at, Time.now)
    
    redirect_to @endorsement.idea
  end

  # DELETE /endorsements/1
  # DELETE /endorsements/1.json
  def destroy
    @endorsement = Endorsement.find(params[:id])
    idea = @endorsement.idea
    @endorsement.destroy

    redirect_to idea
  end
end
