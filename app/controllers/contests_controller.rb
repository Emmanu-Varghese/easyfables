class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # GET /contests/1/edit
  def edit
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = Contest.new(contest_params)
    if @contest.save
      redirect_to contests_path, notice: 'Contest was successfully created.'
    else
      render layout: false
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    if @contest.update(contest_params)
      redirect_to contests_path, notice: 'Contest was successfully updated.'
    else
      render layout: false
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contest_params
      params.require(:contest).permit(:title, :content, :prize_money, :start_date, :end_date, :rule_id, :category_id, :deleted)
    end
  end
