class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.order("scratched asc, updated_at desc")

    Idea.long_expired.each do |i|
      i.destroy
    end

    respond_to do |format|
      format.html # index.html.erb
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
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
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
      else
        format.html { render :action => "new" }
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
      else
        format.html { render :action => "edit" }
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
