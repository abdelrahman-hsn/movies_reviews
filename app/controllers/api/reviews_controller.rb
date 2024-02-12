module Api
  class ReviewsController < ActionController::API
    def import
      return render json: { error: 'file is empty' }, status: :unprocessable_entity if params[:file].nil?

      unless params[:file].content_type == 'text/csv'
        return render json: { error: 'CSV files Only' }, status: :unprocessable_entity
      end

      ImportReviewCsv.new(params[:file]).call

      render json: { message: 'Import started' }, status: :ok
    end
  end
end
