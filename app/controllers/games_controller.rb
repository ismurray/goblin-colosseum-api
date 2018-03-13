class GamesController < ProtectedController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = current_user.games.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = current_user.games.build()

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  # GET /games/high-scores/:range
  # return the top :range scores across all users, with usernames, scores, and ids
  def high_scores
    @scores = Game.where(over: 'true').limit(params[:range]).order('score desc')
    @high_scores = []
    0.upto(@scores.count - 1) do |i|
      high_score = {
        email: User.find(@scores[i].user_id).email,
        score: @scores[i].score,
        id: @scores[i].id
      }
      @high_scores.push(high_score)
    end
    render json: @high_scores
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = current_user.games.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:over, :score, :user_id, :player_state,
                                   :goblin_state, :round)
    end
end
