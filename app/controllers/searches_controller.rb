class SearchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @search = current_user.searches.build(search_params)

    if @search.save
      message = { notice: t('search.created') }
    else
      message = { alert: t('search.failed') }
    end

    redirect_to root_path(params: search_params[:metadata]), message
  end

  private

  def search_params
    params.permit(metadata: {})
  end
end
