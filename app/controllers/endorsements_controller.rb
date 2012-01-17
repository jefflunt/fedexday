class EndorsementsController < ApplicationController
  # GET /endorsements
  # GET /endorsements.json
  def index
    @endorsements = Endorsement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @endorsements }
    end
  end

  # GET /endorsements/1
  # GET /endorsements/1.json
  def show
    @endorsement = Endorsement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @endorsement }
    end
  end

  # GET /endorsements/new
  # GET /endorsements/new.json
  def new
    @endorsement = Endorsement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @endorsement }
    end
  end

  # GET /endorsements/1/edit
  def edit
    @endorsement = Endorsement.find(params[:id])
  end

  # POST /endorsements
  # POST /endorsements.json
  def create
    @endorsement = Endorsement.create(params[:endorsement])
    @endorsement.idea.update_attribute(:updated_at, Time.now)
    
    redirect_to @endorsement.idea
  end

  # PUT /endorsements/1
  # PUT /endorsements/1.json
  def update
    @endorsement = Endorsement.find(params[:id])

    respond_to do |format|
      if @endorsement.update_attributes(params[:endorsement])
        format.html { redirect_to @endorsement, :notice => 'Endorsement was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @endorsement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /endorsements/1
  # DELETE /endorsements/1.json
  def destroy
    @endorsement = Endorsement.find(params[:id])
    @endorsement.destroy

    respond_to do |format|
      format.html { redirect_to endorsements_url }
      format.json { head :ok }
    end
  end
end
