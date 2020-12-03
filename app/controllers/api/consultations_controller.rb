class Api::ConsultationsController < ApplicationController
  def preview
    @html = view_context.markdown(params[:content])
  end
end
