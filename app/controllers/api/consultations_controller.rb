class Api::ConsultationsController < ApplicationController
  def preview
    @html = view_context.markdown(params[:body])
  end
end
