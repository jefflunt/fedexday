class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.order("updated_at desc")
    
    Idea.long_expired.each do |i|
      i.destroy
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    @new_comment = Comment.new(:idea_id => @idea.id)
    @new_endorsement = Endorsement.new(:idea_id => @idea.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, :notice => 'Idea was successfully created.' }
        format.json { render :json => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.json { render :json => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, :notice => 'Idea was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /ideas/1/scratch
  # Allows to "scratch/unscratch" an idea, which doesn't destroy it, but will mark/unmark an idea as "scratched out"
  def scratch
    @idea = Idea.find(params[:id])
    
    @idea.update_attribute(:scratched, !@idea.scratched)
    redirect_to :back
  end
end
