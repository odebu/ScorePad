class AffiliationsController < ApplicationController

  def index
    @affiliations = Affiliation.all
    @affiliation = Affiliation.new
    @teams = Team.all
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliations }
    end
  end

  # GET /affiliations/1
  # GET /affiliations/1.json
  def show
    @affiliation = Affiliation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliation }
    end
  end

  # POST /affiliations
  # POST /affiliations.json
  def create
    @affiliations = Affiliation.all
    @affiliation = Affiliation.new(params[:affiliation])
    @teams = Team.all
    @players = Player.all

    respond_to do |format|
      if @affiliation.save
        format.html { redirect_to @affiliation, notice: 'affiliation was successfully created.' }
        format.json { render json: @affiliation, status: :created, location: @affiliation }
      else
        format.html { render action: "index" }
        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /affiliations/1/edit
  def edit
    @affiliation = Affiliation.find(params[:id])
  end

  # PUT /affiliations/1
  # PUT /affiliations/1.json
  def update
    @affiliation = Affiliation.find(params[:id])

    respond_to do |format|
      if @affiliation.update_attributes(params[:affiliation])
        format.html { redirect_to @affiliation, notice: 'Affiliation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliations/1
  # DELETE /affiliations/1.json
  def destroy
    @affiliation = Affiliation.find(params[:id])
    @affiliation.destroy

    respond_to do |format|
      format.html { redirect_to affiliations_url }
      format.json { head :no_content }
    end
  end

end
